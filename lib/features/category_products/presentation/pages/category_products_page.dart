import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/components/empty_message.dart';
import '../../../../core/shared/components/grid_view_generate.dart';
import '../../../../core/shared/components/product_card.dart';
import '../../../../core/shared/components/product_card_skeleton.dart';
import '../../../../core/shared/features/entities/category.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../bloc/category_products_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final Category category;
  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CategoryProductsBloc>()
            ..add(ProductFetchedByCategory(categoryId: category.id)),

      child: Scaffold(
        appBar: BaseAppBar(
          title: category.name,
          actions: [
            IconButton(
              onPressed: () => debugPrint('Search pressed'),
              icon: const CustomIcon(icon: AssetsConst.search),
              tooltip: context.l10n.search,
            ),
          ],
        ),
        body: Padding(
          padding: context.padding.pH24,
          child: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
            builder: (context, state) {
              if (state is CategoryProductsLoading) {
                return GridViewGenerate(
                  length: 6,
                  width: context.productCardSize,
                  child: (_, _) => const ProductCardSkeleton(),
                );
              }

              if (state is CategoryProductsFailure) {
                ShowToast.showErrorToast(message: state.message);
              }

              if (state is CategoryProductsLoaded &&
                  state.products.isNotEmpty) {
                final items = state.products;

                return SingleChildScrollView(
                  child: GridViewGenerate(
                    length: items.length,
                    width: context.productCardSize,
                    child: (_, index) => ProductCard(product: items[index]),
                  ),
                );
              }

              return EmptyMessage(
                icon: AssetsConst.emptyBox,
                message: context.l10n.emptyProductMsg,
              );
            },
          ),
        ),
      ),
    );
  }
}
