import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class CartCardVariant extends StatelessWidget {
  final String color;
  final String size;

  const CartCardVariant({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    final subduedStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
      fontWeight: FontWeight.bold,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(color, style: subduedStyle),
        SizedBox(
          height: context.spacing.s16,
          child: VerticalDivider(
            thickness: 1,
            color: context.colorScheme.outlineVariant,
          ),
        ),
        Text(size, style: subduedStyle),
      ],
    );
  }
}
