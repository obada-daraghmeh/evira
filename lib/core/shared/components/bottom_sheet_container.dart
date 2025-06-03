import 'package:flutter/material.dart';

import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final bool hasBottomPadding;

  const BottomSheetContainer({
    super.key,
    required this.child,
    this.hasBottomPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
            context.spacing.s24,
            context.spacing.s48,
            context.spacing.s24,
            hasBottomPadding ? context.spacing.s24 : 0,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: context.borderRadius.borderRadiusVT24,
          ),
          child: child,
        ),
        Positioned(
          top: context.spacing.s24,
          child: Container(
            width: context.spacing.s48,
            height: context.spacing.s4,
            decoration: BoxDecoration(
              color: context.colorScheme.onSurface.withValues(alpha: 0.12),
              borderRadius: context.borderRadius.borderRadius4,
            ),
          ),
        ),
      ],
    );
  }
}
