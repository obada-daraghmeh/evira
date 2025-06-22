import 'package:flutter/material.dart';

import '../../../utils/extensions/constants_extension.dart';
import '../../../utils/extensions/intl_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../features/entities/product.dart';
import 'rating_and_sales.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // final bool hasDiscount = product.discount != 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.getLocalizedName('en'),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // RatingAndSales(count: product.salesNumber, rating: 4.5),
        RatingAndSales(count: 0, rating: 4.5),
        Row(
          spacing: context.spacing.s4,
          children: [
            Text(
              context.l10n.priceInILS(product.basePrice.toString()),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                // fontSize: hasDiscount ? 12 : 16,
                // color: hasDiscount
                //     ? context.colorScheme.onSurfaceVariant.withValues(
                //         alpha: 0.6,
                //       )
                //     : context.colorScheme.primary,
                // decoration: hasDiscount ? TextDecoration.lineThrough : null,
              ),
            ),
            // if (hasDiscount)
            //   Text(
            //     context.l10n.priceInILS(
            //       ProductHelpers.calcTotalPrice(
            //         price: product.basePrice,
            //         // discount: product.discount,
            //         discount: 0,
            //       ).toStringAsFixed(2),
            //     ),
            //     style: context.textTheme.titleMedium?.copyWith(
            //       fontWeight: FontWeight.bold,
            //       color: context.colorScheme.primary,
            //     ),
            //   ),
          ],
        ),
      ],
    );
  }
}
