import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/product/product_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/grid_view_generate.dart';
import '../../../../core/shared/components/product_card.dart';
import '../../../../core/shared/components/product_card_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../bloc/search_bloc.dart';
import '../widgets/empty_search.dart';
import '../widgets/search_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: Padding(
          padding: context.padding.pH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.recent,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      context.l10n.clearAll,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              // RecentListTile(title: 'title'),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
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
            ],
          ),
        ),
      ),
    );
  }
}
