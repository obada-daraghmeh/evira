import 'package:flutter/material.dart';

import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';
import '../widgets/custom_icon.dart';

class EmptyMessage extends StatelessWidget {
  final String message;
  final String icon;
  final double? iconSize;

  const EmptyMessage({
    super.key,
    required this.message,
    required this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: context.spacing.s12,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon(icon: icon, isColoredIcon: true, size: iconSize ?? 100),
          Text(
            message,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurfaceVariant.withValues(
                alpha: 0.6,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
