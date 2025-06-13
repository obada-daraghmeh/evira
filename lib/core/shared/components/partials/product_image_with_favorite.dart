import 'package:flutter/material.dart';

import '../../../utils/extensions/constants_extension.dart';
import '../../../utils/extensions/intl_extension.dart';
import '../../../utils/extensions/media_query_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../../utils/helpers/product_helpers.dart';
import '../../widgets/custom_network_image.dart';
import '../favorite_button.dart';

class ProductImageWithFavorite extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final double discount;

  const ProductImageWithFavorite({
    super.key,
    required this.productId,
    required this.imageUrl,
    this.discount = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImageContainer(context),
        _buildFavoriteButton(context),
        if (discount != 0.0) _buildDiscountRibbon(context),
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
      child: CustomNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
    );
  }

  Positioned _buildFavoriteButton(BuildContext context) {
    return Positioned(
      top: context.spacing.s8,
      right: context.spacing.s8,
      child: FavoriteButton(productId: productId),
    );
  }

  Positioned _buildDiscountRibbon(BuildContext context) {
    return Positioned(
      top: context.spacing.s8,
      left: context.spacing.s8,
      child: Container(
        padding: context.padding.pH8,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: context.borderRadius.borderRadius8,
        ),
        child: Text(
          context.l10n.discountPercent(ProductHelpers.calcDiscount(discount)),
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
