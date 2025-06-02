import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/product/product_bloc.dart';
import '../../../../core/shared/components/error_message.dart';
import '../../../../core/shared/components/grid_view_generate.dart';
import '../../../../core/shared/components/product_card.dart';
import '../../../../core/shared/components/product_card_skeleton.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    const int maxDisplayCount = 6;

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return GridViewGenerate(
            length: maxDisplayCount,
            width: context.productCardSize,
            child: (_, _) => const ProductCardSkeleton(),
          );
        }

        if (state is ProductFailure) {
          ShowToast.showErrorToast(message: state.message);
        }

        if (state is ProductLoaded && state.products.isNotEmpty) {
          final items = state.products.take(maxDisplayCount).toList();

          return GridViewGenerate(
            length: items.length,
            width: context.productCardSize,
            child: (_, index) => ProductCard(product: items[index]),
          );
        }

        return const ErrorMessage();
      },
    );
  }
}
