import 'package:flutter/material.dart';

import '../../../utils/extensions/constants_extension.dart';
import 'rating_and_reviews.dart';
import 'sales_number_chip.dart';

class RatingAndSales extends StatelessWidget {
  final int count;
  final double rating;

  const RatingAndSales({super.key, required this.count, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingAndReviews(rating: rating),
        SizedBox(height: context.spacing.s16, child: VerticalDivider()),
        SalesNumberChip(count: count),
      ],
    );
  }
}
