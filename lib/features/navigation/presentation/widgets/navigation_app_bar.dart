import 'package:flutter/material.dart';

import '../../domain/entities/navigation_page_type.dart';

PreferredSizeWidget? navigationAppBar(NavigationPageType type) {
  switch (type) {
    case NavigationPageType.home:
      return null;
    case NavigationPageType.cart:
      return AppBar(title: const Text('Cart'));
    case NavigationPageType.orders:
      return AppBar(title: const Text('Orders'));
    case NavigationPageType.wallet:
      return AppBar(title: const Text('Wallet'));
    case NavigationPageType.profile:
      return AppBar(title: const Text('Profile'));
  }
}
