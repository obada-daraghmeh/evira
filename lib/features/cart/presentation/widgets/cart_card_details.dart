import 'package:flutter/widgets.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';
import '../../domain/entities/cart.dart';
import 'cart_card_quantity.dart';
import 'cart_card_variant.dart';

class CartCardDetails extends StatelessWidget {
  final Cart cartItem;
  final bool isReadOnly;

  const CartCardDetails({
    super.key,
    required this.cartItem,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: context.spacing.s8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Formatter.upperFirst(cartItem.getLocalizedName('en')),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.priceInILS(
                      cartItem.basePrice.toStringAsFixed(2),
                    ),
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CartCardVariant(color: 'Red', size: 'M'),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CartCardQuantity(
              quantity: cartItem.quantity,
              isReadOnly: isReadOnly,
            ),
          ),
        ],
      ),
    );
  }
}
