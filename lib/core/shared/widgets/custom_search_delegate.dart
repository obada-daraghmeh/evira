import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/widgets/empty_search.dart';
import '../../constants/assets_const.dart';
import '../../controllers/search/search_bloc.dart';
import '../../services/get_it_service.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/extensions/media_query_extension.dart';
import '../../utils/helpers/show_toast.dart';
import '../components/grid_view_generate.dart';
import '../components/product_card.dart';
import '../components/product_card_skeleton.dart';
import 'custom_icon.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc controller = getIt<SearchBloc>();
  Timer? _debounce;

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty) {
        controller.add(SearchByTitle(title: query));
      }
    });
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: context.padding.pL8,
      child: IconButton(
        icon: const CustomIcon(icon: AssetsConst.arrowLeftBold),
        onPressed: () => close(context, null),
        tooltip: context.l10n.back,
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    controller.add(SearchByTitle(title: query));
    super.showResults(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: context.padding.pR8,
        child: AnimatedOpacity(
          opacity: query.isEmpty ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              query = '';
              controller.add(SearchByTitle(title: query));
            },
            tooltip: context.l10n.clear,
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      controller.add(FetchSuggestions());
    } else {
      _onQueryChanged(query);
    }

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller,
      builder: (context, state) {
        final isLoading = state is SearchLoading;
        final suggestionsUI = _buildSuggestionsUI(context, state);

        return Column(
          children: [
            if (isLoading) const LinearProgressIndicator(),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: suggestionsUI,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSuggestionsUI(BuildContext context, SearchState state) {
    if (state is SearchLoaded) {
      final suggestions = state.products.map((e) => e.title).toList();

      if (suggestions.isEmpty) {
        return _noSuggestionsMessage(context);
      }

      return ListView.builder(
        key: const ValueKey('suggestionsList'),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            contentPadding: context.padding.pH24,
            title: _highlightedText(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _highlightedText(String suggestion) {
    if (query.isEmpty ||
        !suggestion.toLowerCase().startsWith(query.toLowerCase())) {
      return Text(suggestion);
    }

    return Text.rich(
      TextSpan(
        text: suggestion.substring(0, query.length),
        style: const TextStyle(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: suggestion.substring(query.length),
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _noSuggestionsMessage(BuildContext context) {
    return ListTile(
      key: const ValueKey('noSuggestions'),
      title: Center(
        child: Text(
          context.l10n.noSuggestionsMatch(query),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        key: ValueKey(query),
        padding: context.padding.p24,
        child: BlocBuilder<SearchBloc, SearchState>(
          bloc: controller,
          builder: (context, state) {
            if (state is SearchLoading) {
              return Row(
                spacing: context.spacing.s12,
                children: const [
                  Expanded(child: ProductCardSkeleton()),
                  Expanded(child: ProductCardSkeleton()),
                ],
              );
            }

            if (state is SearchFailure) {
              ShowToast.showErrorToast(message: state.message);
            }

            if (state is SearchLoaded && state.products.isNotEmpty) {
              return GridViewGenerate(
                length: state.products.length,
                width: context.productCardSize,
                child: (_, index) =>
                    ProductCard(product: state.products[index]),
              );
            }

            return const EmptySearch();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.close();
    super.dispose();
  }
}
