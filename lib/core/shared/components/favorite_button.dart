import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/assets_const.dart';
import '../../controllers/wishlist/wishlist_cubit.dart';
import '../../utils/extensions/theme_extension.dart';
import '../widgets/custom_icon.dart';

class FavoriteButton extends StatelessWidget {
  final String productId;
  const FavoriteButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<WishlistCubit, bool>(
      (cubit) => cubit.isInWishlist(productId),
    );

    return IconButton.filled(
      onPressed: () => context.read<WishlistCubit>().toggleWishlist(productId),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutBack,
          ),
          child: child,
        ),
        child: CustomIcon(
          key: ValueKey(isFavorite),
          icon: isFavorite ? AssetsConst.heartBold : AssetsConst.heart,
          customColor: context.colorScheme.onPrimary,
        ),
      ),
      style: IconButton.styleFrom(backgroundColor: context.colorScheme.primary),
    );
  }
}
