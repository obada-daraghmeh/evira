import 'package:flutter/material.dart';

import '../../../../core/shared/components/quantity_selector.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class CartCardQuantity extends StatelessWidget {
  final int quantity;
  final bool isReadOnly;

  const CartCardQuantity({
    super.key,
    required this.quantity,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return isReadOnly
        ? _disabledQuantitySelector(context)
        : const QuantitySelector();
  }

  Container _disabledQuantitySelector(BuildContext context) {
    return Container(
      padding: context.padding.p4,
      decoration: BoxDecoration(
        borderRadius: context.borderRadius.borderRadius16,
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        spacing: context.spacing.s8,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQtyButton(context, icon: Icons.remove),
          Text(
            quantity.toString(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildQtyButton(context, icon: Icons.add),
        ],
      ),
    );
  }

  IconButton _buildQtyButton(BuildContext context, {required IconData icon}) {
    return IconButton(
      onPressed: null,
      icon: Icon(icon, size: context.iconSize.sm),
      visualDensity: VisualDensity.compact,
    );
  }
}
