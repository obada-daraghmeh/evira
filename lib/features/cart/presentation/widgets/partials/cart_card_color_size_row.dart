import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';
import '../../../../../core/utils/helpers/product_helpers.dart';

class CartCardColorSizeRow extends StatelessWidget {
  final String hexCode;
  final String size;

  const CartCardColorSizeRow({
    super.key,
    required this.hexCode,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final subduedStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: context.spacing.s12,
          backgroundColor: ProductHelpers.colorFromHexCode(hexCode),
        ),
        Text(context.l10n.color, style: subduedStyle),
        SizedBox(
          height: context.spacing.s16,
          child: VerticalDivider(
            thickness: 1,
            color: context.colorScheme.outlineVariant,
          ),
        ),
        Text(context.l10n.sizeSize(size), style: subduedStyle),
      ],
    );
  }
}
