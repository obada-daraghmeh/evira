import 'package:flutter/material.dart';

import '../../../../../core/shared/components/quantity_selector.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';
import '../../../../../core/utils/helpers/product_helpers.dart';

class CartCardPriceQuantityRow extends StatelessWidget {
  final double price;
  final double discount;
  final int quantity;
  final bool isReadOnly;

  const CartCardPriceQuantityRow({
    super.key,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    final calcPrice = ProductHelpers.calcTotalPrice(
      price: price,
      discount: discount,
      quantity: quantity,
    ).toStringAsFixed(2);

    return Row(
      spacing: context.spacing.s12,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            context.l10n.priceInILS(calcPrice),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        isReadOnly
            ? CircleAvatar(
                radius: 15,
                backgroundColor: context.colorScheme.surfaceContainerHighest,
                child: Text(
                  quantity.toString(),
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const QuantitySelector(),
      ],
    );
  }
}
