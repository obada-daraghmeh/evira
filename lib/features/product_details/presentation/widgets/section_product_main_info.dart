import 'package:flutter/material.dart';

import '../../../../core/shared/components/favorite_button.dart';
import '../../../../core/shared/components/partials/rating_and_reviews.dart';
import '../../../../core/shared/components/partials/sales_number_chip.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';

class SectionProductMainInfo extends StatelessWidget {
  final Product product;
  const SectionProductMainInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                Formatter.upperFirst(product.getLocalizedName('en')),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FavoriteButton(productId: product.id),
          ],
        ),
        Row(
          spacing: context.spacing.s16,
          children: [
            const SalesNumberChip(count: 0),
            const RatingAndReviews(rating: 0, hasReviews: true, reviews: 0),
          ],
        ),
      ],
    );
  }
}
