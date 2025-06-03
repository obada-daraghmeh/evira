import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/quantity/quantity_cubit.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/extensions/theme_extension.dart';
import '../../utils/helpers/product_helpers.dart';

class TotalPrice extends StatelessWidget {
  final double price;
  final double discount;

  const TotalPrice({super.key, required this.price, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.totalPrice,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        BlocBuilder<QuantityCubit, QuantityState>(
          builder: (context, state) {
            return Text(
              context.l10n.priceInILS(
                ProductHelpers.calcTotalPrice(
                  price: price,
                  discount: discount,
                  quantity: state.quantity,
                ).toStringAsFixed(2),
              ),
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
