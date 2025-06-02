import 'package:flutter/material.dart';

import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/media_query_extension.dart';
import '../widgets/custom_skeleton.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.productCardSize,
      child: Column(
        spacing: context.spacing.s8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomSkeleton(
                width: context.productCardSize,
                height: context.productCardSize,
                borderRadius: context.spacing.s24,
              ),
              Positioned(
                top: context.spacing.s8,
                right: context.spacing.s8,
                child: CustomSkeleton(
                  width: context.spacing.s48,
                  height: context.spacing.s48,
                  borderRadius: context.spacing.s50,
                ),
              ),
            ],
          ),
          Column(
            spacing: context.spacing.s4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSkeleton(
                width: context.productCardSize,
                height: context.spacing.s16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: context.spacing.s4,
                    children: [
                      CustomSkeleton(
                        width: context.spacing.s24,
                        height: context.spacing.s24,
                      ),
                      CustomSkeleton(
                        width: context.spacing.s24,
                        height: context.spacing.s16,
                      ),
                    ],
                  ),
                  CustomSkeleton(
                    width: context.spacing.s4,
                    height: context.spacing.s16,
                  ),
                  CustomSkeleton(
                    width: context.productCardSize / 2,
                    height: context.spacing.s24,
                  ),
                ],
              ),
              CustomSkeleton(
                width: context.productCardSize / 2,
                height: context.spacing.s16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
