import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/quantity/quantity_cubit.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<QuantityCubit>();
    return BlocBuilder<QuantityCubit, QuantityState>(
      builder: (context, state) {
        return Container(
          padding: context.padding.pH4V2,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: context.borderRadius.borderRadius40,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQtyButton(
                context,
                icon: Icons.remove,
                onPressed: () => controller.decrement(),
              ),
              Text(
                state.quantity.toString(),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildQtyButton(
                context,
                icon: Icons.add,
                onPressed: () => controller.increment(),
              ),
            ],
          ),
        );
      },
    );
  }

  IconButton _buildQtyButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: context.iconSize.sm),
      visualDensity: VisualDensity.compact,
    );
  }
}
