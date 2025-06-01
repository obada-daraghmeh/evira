import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/extensions/theme_extension.dart';

class NavigationPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Temp test data
      appBar: AppBar(title: const Text('Test App Bar')),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: context.colorScheme.onSurfaceVariant.withValues(
          alpha: 0.6,
        ),
        selectedItemColor: context.colorScheme.primary,
      ),
    );
  }
}
