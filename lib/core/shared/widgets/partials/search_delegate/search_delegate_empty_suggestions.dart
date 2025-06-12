import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/assets_const.dart';
import '../../../../controllers/search/search_bloc.dart';
import '../../../../utils/extensions/constants_extension.dart';
import '../../../../utils/extensions/intl_extension.dart';
import '../../custom_icon.dart';
import 'partials/suggestion_header_title.dart';

class SearchDelegateEmptySuggestions extends StatelessWidget {
  final SearchBloc controller;
  final void Function(String title) onTap;

  const SearchDelegateEmptySuggestions({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: controller,
      builder: (context, state) {
        List<String> suggestions = [];
        List<String> history = [];

        if (state is SearchLoading) return const LinearProgressIndicator();

        if (state is SearchSuggestionsLoaded) {
          suggestions = state.suggestions;
          history = state.history;
        }

        return Scrollbar(
          child: ListView(
            children: [
              if (history.isNotEmpty) ...[
                SuggestionHeaderTitle(
                  isHistory: true,
                  title: context.l10n.recent,
                  icon: AssetsConst.searchList,
                  onPressed: () => controller.add(ClearHistory()),
                ),
                ...history.map(
                  (title) => ListTile(
                    leading: const CustomIcon(icon: AssetsConst.search),
                    title: Text(title),
                    trailing: IconButton(
                      icon: const CustomIcon(icon: AssetsConst.close),
                      onPressed: () =>
                          controller.add(DeleteFromHistory(title: title)),
                    ),
                    onTap: () => onTap(title),
                    contentPadding: context.padding.pL24R16,
                  ),
                ),
                Padding(padding: context.padding.pH24, child: const Divider()),
              ],
              if (suggestions.isNotEmpty) ...[
                SuggestionHeaderTitle(
                  title: context.l10n.suggestions,
                  icon: AssetsConst.idea,
                ),
                SizedBox(height: context.spacing.s12),
                ...suggestions.map(
                  (title) => ListTile(
                    leading: const CustomIcon(icon: AssetsConst.search),
                    title: Text(title),
                    onTap: () => onTap(title),
                    contentPadding: context.padding.pH24,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
