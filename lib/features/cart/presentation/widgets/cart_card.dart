import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../domain/entities/cart.dart';
import 'cart_card_container.dart';
import 'cart_card_details.dart';
import 'cart_card_image.dart';

class CartCard extends StatelessWidget {
  final Cart cartItem;
  final bool isReadOnly;

  const CartCard({super.key, required this.cartItem, this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return CartCardContainer(
      child: Row(
        spacing: context.spacing.s16,
        children: [
          CartCardImage(imageUrl: cartItem.image),
          CartCardDetails(cartItem: cartItem, isReadOnly: isReadOnly),
        ],
      ),
    );
  }
}
