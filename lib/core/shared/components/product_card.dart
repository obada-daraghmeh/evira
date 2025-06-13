import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes_const.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/media_query_extension.dart';
import '../features/entities/product.dart';
import 'partials/product_image_with_favorite.dart';
import 'partials/product_info.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(RoutesConst.productDetails, extra: product),
      child: SizedBox(
        width: context.productCardSize,
        child: Column(
          spacing: context.spacing.s8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageWithFavorite(
              imageUrl: product.thumbnailUrl,
              discount: product.discount,
              productId: product.id,
            ),
            ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
