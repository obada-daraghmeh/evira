import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';

class CustomSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final Widget? child;
  final double? borderRadius;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const CustomSkeleton({
    super.key,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.child,
    this.borderRadius,
    this.borderRadiusGeometry,
  });

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.onSurface;
    return Shimmer.fromColors(
      baseColor: baseColor ?? color.withValues(alpha: 0.04),
      highlightColor: highlightColor ?? color.withValues(alpha: 0.08),
      child: _skeleton(context, color: color),
    );
  }

  Container _skeleton(BuildContext context, {required Color color}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            borderRadiusGeometry ??
            BorderRadius.circular(borderRadius ?? context.spacing.s8),
      ),
      child: child,
    );
  }
}
