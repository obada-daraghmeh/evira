import 'package:flutter/material.dart';

import '../../../utils/extensions/constants_extension.dart';
import '../../../utils/extensions/media_query_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../features/entities/product.dart';
import '../../widgets/custom_network_image.dart';
import '../favorite_button.dart';

class ProductImageWithFavorite extends StatelessWidget {
  final Product product;
  const ProductImageWithFavorite({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImageContainer(context),
        _buildFavoriteButton(context),
        // if (product.discount != 0.0) _buildDiscountRibbon(context),
      ],
    );
  }

  Container _buildImageContainer(BuildContext context) {
    return Container(
      width: context.productCardSize,
      height: context.productCardSize,
      padding: context.padding.p16,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.5,
        ),
        borderRadius: context.borderRadius.borderRadius24,
      ),
      child: Hero(
        tag: product.imageCoverUrl,
        child: CustomNetworkImage(
          imageUrl: product.imageCoverUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned _buildFavoriteButton(BuildContext context) {
    return Positioned(
      top: context.spacing.s8,
      right: context.spacing.s8,
      child: FavoriteButton(productId: product.id),
    );
  }

  // Positioned _buildDiscountRibbon(BuildContext context) {
  //   return Positioned(
  //     top: context.spacing.s8,
  //     left: context.spacing.s8,
  //     child: Container(
  //       padding: context.padding.pH8,
  //       decoration: BoxDecoration(
  //         color: context.colorScheme.primary,
  //         borderRadius: context.borderRadius.borderRadius8,
  //       ),
  //       child: Text(
  //         context.l10n.discountPercent(
  //           0,
  //           // ProductHelpers.calcDiscount(product.discount),
  //         ),
  //         style: context.textTheme.bodySmall?.copyWith(
  //           color: context.colorScheme.onPrimary,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
