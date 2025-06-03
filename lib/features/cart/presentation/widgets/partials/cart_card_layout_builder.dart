import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_skeleton.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';

class CartCardLayoutBuilder extends StatelessWidget {
  final Widget child;
  final bool showSkeleton;

  const CartCardLayoutBuilder({
    super.key,
    required this.child,
    this.showSkeleton = false,
  });

  @override
  Widget build(BuildContext context) {
    final padding = context.padding.p16;
    final borderRadius = context.borderRadius.borderRadius24;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 400;
        final cardHeight = isCompact
            ? constraints.maxWidth / 2
            : constraints.maxWidth / 2.5;

        if (showSkeleton) {
          return _buildCardContainerSkeleton(
            context,
            cardHeight: cardHeight,
            padding: padding,
          );
        }
        return _buildCardContainer(
          context,
          cardHeight: cardHeight,
          padding: padding,
          borderRadius: borderRadius,
        );
      },
    );
  }

  SizedBox _buildCardContainerSkeleton(
    BuildContext context, {
    required double cardHeight,
    required EdgeInsets padding,
  }) {
    return SizedBox(
      height: cardHeight,
      child: Stack(
        children: [
          CustomSkeleton(height: cardHeight, borderRadius: context.spacing.s24),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }

  Container _buildCardContainer(
    BuildContext context, {
    required double cardHeight,
    required EdgeInsets padding,
    required BorderRadius borderRadius,
  }) {
    final color = context.isLight
        ? context.colorScheme.surface
        : context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5);
    final boxShadow = context.isLight
        ? [
            BoxShadow(
              color: context.colorScheme.onSurface.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: Offset.zero,
            ),
          ]
        : null;

    return Container(
      height: cardHeight,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
