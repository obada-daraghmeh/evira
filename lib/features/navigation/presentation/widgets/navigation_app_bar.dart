import 'package:flutter/material.dart';

import '../../../cart/presentation/widgets/cart_app_bar.dart';
import '../../../profile/presentation/widgets/profile_app_bar.dart';
import '../../domain/entities/navigation_page_type.dart';

PreferredSizeWidget? navigationAppBar(NavigationPageType type) {
  switch (type) {
    case NavigationPageType.home:
      return null;
    case NavigationPageType.cart:
      return const CartAppBar();
    case NavigationPageType.orders:
      return AppBar(title: const Text('Orders'));
    case NavigationPageType.wallet:
      return AppBar(title: const Text('Wallet'));
    case NavigationPageType.profile:
      return const ProfileAppBar();
  }
}
