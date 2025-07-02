import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class CartCardContainer extends StatelessWidget {
  final double? height;
  final Color? bgColor;
  final bool hasShadow;
  final EdgeInsets? padding;
  final bool showSkeleton;
  final Widget child;

  const CartCardContainer({
    super.key,
    this.height,
    this.bgColor,
    this.hasShadow = true,
    this.padding,
    this.showSkeleton = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 400;
        final cardHeight = isCompact
            ? constraints.maxWidth / 2
            : constraints.maxWidth / 2.5;

        final color = context.isLight
            ? context.colorScheme.surface
            : context.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              );

        final boxShadow = context.isLight
            ? [
                BoxShadow(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: Offset.zero,
                ),
              ]
            : null;

        return showSkeleton
            ? SizedBox(
                height: cardHeight,
                child: Stack(
                  children: [
                    CustomSkeleton(
                      height: cardHeight,
                      borderRadius: context.spacing.s24,
                    ),
                    Padding(
                      padding: padding ?? context.padding.p16,
                      child: child,
                    ),
                  ],
                ),
              )
            : Container(
                height: height ?? cardHeight,
                decoration: BoxDecoration(
                  color: bgColor ?? color,
                  boxShadow: hasShadow ? boxShadow : null,
                  borderRadius: context.borderRadius.borderRadius24,
                ),
                alignment: Alignment.centerRight,
                padding: padding ?? context.padding.p16,
                child: child,
              );
      },
    );
  }
}
