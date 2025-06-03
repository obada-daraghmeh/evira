import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class CartCheckOutSkeleton extends StatelessWidget {
  const CartCheckOutSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sWidth,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Stack(
        children: [
          CustomSkeleton(
            width: context.sWidth,
            height: context.sHeight,
            borderRadiusGeometry: BorderRadius.vertical(
              top: Radius.circular(context.spacing.s24),
            ),
          ),
          Padding(
            padding: context.padding.p24,
            child: Row(
              spacing: context.spacing.s24,
              children: [
                Column(
                  spacing: context.spacing.s4,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSkeleton(
                      width: context.spacing.s48,
                      height: context.spacing.s16,
                    ),
                    CustomSkeleton(
                      width: context.spacing.s60,
                      height: context.spacing.s24,
                    ),
                  ],
                ),
                Expanded(
                  child: CustomSkeleton(
                    height: context.sHeight,
                    borderRadius: context.spacing.s24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
