import 'package:flutter/material.dart';

import '../../../constants/assets_const.dart';
import '../../../utils/extensions/constants_extension.dart';
import '../../../utils/extensions/intl_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../widgets/custom_icon.dart';

class RatingAndReviews extends StatelessWidget {
  final double rating;
  final bool hasReviews;
  final int reviews;

  const RatingAndReviews({
    super.key,
    required this.rating,
    this.hasReviews = false,
    this.reviews = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s4,
      children: [
        CustomIcon(icon: AssetsConst.starBulk),
        Text(rating.toString(), style: context.textTheme.labelMedium),
        if (hasReviews)
          Text(
            context.l10n.countReviews(reviews),
            style: context.textTheme.labelMedium,
          ),
      ],
    );
  }
}
