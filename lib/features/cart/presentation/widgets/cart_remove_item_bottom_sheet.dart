import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/controllers/cart/cart_bloc.dart';
import '../../../../core/shared/components/bottom_sheet_container.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../../domain/entities/cart.dart';
import 'cart_card.dart';

class CartRemoveItemBottomSheet extends StatelessWidget {
  final Cart cart;
  const CartRemoveItemBottomSheet({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartBloc>();
    return BottomSheetContainer(
      child: Column(
        spacing: context.spacing.s16,
        children: [
          Text(
            context.l10n.removeFromCart,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          CartCard(cartItem: cart, isReadOnly: true),
          const Divider(),
          Row(
            spacing: context.spacing.s12,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pop(),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size.fromHeight(context.spacing.s48),
                  ),
                  child: Text(context.l10n.cancel),
                ),
              ),
              Expanded(
                child: LoadingButton(
                  isLoading: cartController.state is CartLoading,
                  text: context.l10n.remove,
                  onPressed: () async {
                    // cartController.add(
                    //   RemoveFromCart(id: cart.id!, userId: cart.userId),
                    // );
                    context.pop();
                    ShowToast.showSuccessToast(
                      message: 'Item deleted successfully',
                    );
                  },
                  height: context.spacing.s48,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
