import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/partials/rating_and_reviews.dart';
import '../../../../core/shared/components/partials/sales_number_chip.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class ProductSectionInfo extends StatelessWidget {
  final Product product;
  const ProductSectionInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: CustomIcon(icon: AssetsConst.heart),
            ),
          ],
        ),
        Row(
          spacing: context.spacing.s16,
          children: [
            SalesNumberChip(count: product.salesNumber),
            RatingAndReviews(rating: 4.5, hasReviews: true, reviews: 4764),
          ],
        ),
        SizedBox(height: context.spacing.s8),
        const Divider(),
        SizedBox(height: context.spacing.s8),
      ],
    );
  }
}
