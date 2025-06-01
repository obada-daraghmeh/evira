import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../domain/entities/navigation_page_type.dart';

Widget navigationPage(NavigationPageType type) {
  switch (type) {
    case NavigationPageType.home:
      return const HomePage();
    case NavigationPageType.cart:
      return const Center(child: Text('Cart Page'));
    case NavigationPageType.orders:
      return const Center(child: Text('Orders Page'));
    case NavigationPageType.wallet:
      return const Center(child: Text('Wallet Page'));
    case NavigationPageType.profile:
      return const Center(child: Text('Profile Page'));
  }
}
