import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../domain/entities/cart.dart';
import 'partials/cart_card_details.dart';
import 'partials/cart_card_image.dart';
import 'partials/cart_card_layout_builder.dart';

class CartCard extends StatelessWidget {
  final Cart cart;
  final bool isReadOnly;

  const CartCard({super.key, required this.cart, this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return CartCardLayoutBuilder(
      child: Row(
        spacing: context.spacing.s16,
        children: [
          CartCardImage(imageUrl: cart.thumbnailUrl ?? ''),
          CartCardDetails(cart: cart, isReadOnly: isReadOnly),
        ],
      ),
    );
  }
}
