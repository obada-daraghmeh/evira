import 'package:flutter/widgets.dart';

import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../domain/entities/cart.dart';
import 'cart_card_color_size_row.dart';
import 'cart_card_price_quantity_row.dart';
import 'cart_card_title_row.dart';

class CartCardDetails extends StatelessWidget {
  final Cart cart;
  final bool isReadOnly;

  const CartCardDetails({
    super.key,
    required this.cart,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartCardTitleRow(cart: cart, isReadOnly: isReadOnly),
          isReadOnly
              ? SizedBox(height: context.spacing.s16)
              : const SizedBox.shrink(),
          CartCardColorSizeRow(hexCode: cart.color, size: cart.size),
          const Spacer(),
          CartCardPriceQuantityRow(
            price: cart.price ?? 0.0,
            quantity: cart.quantity,
            discount: cart.discount ?? 0.0,
            isReadOnly: isReadOnly,
          ),
        ],
      ),
    );
  }
}
