import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../features/home/presentation/widgets/empty_search.dart';
import '../../../../controllers/search/search_bloc.dart';
import '../../../../utils/extensions/constants_extension.dart';
import '../../../../utils/extensions/media_query_extension.dart';
import '../../../../utils/helpers/show_toast.dart';
import '../../../components/grid_view_generate.dart';
import '../../../components/product_card.dart';
import '../../../components/product_card_skeleton.dart';

class SearchDelegateResults extends StatelessWidget {
  final String query;
  final SearchBloc controller;

  const SearchDelegateResults({
    super.key,
    required this.query,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ShowToast.showErrorToast(message: state.message);
            });
          }

          if (state is SearchResultsLoaded && state.products.isNotEmpty) {
            return GridViewGenerate(
              length: state.products.length,
              width: context.productCardSize,
              child: (_, index) => ProductCard(product: state.products[index]),
            );
          }

          return const EmptySearch();
        },
      ),
    );
  }
}
