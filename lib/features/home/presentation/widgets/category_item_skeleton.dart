import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';

class CategoryItemSkeleton extends StatelessWidget {
  const CategoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s8,
      children: [
        CustomSkeleton(
          width: context.spacing.s56,
          height: context.spacing.s56,
          borderRadius: context.spacing.s50,
        ),
        CustomSkeleton(
          width: context.spacing.s100,
          height: context.spacing.s16,
        ),
      ],
    );
  }
}
