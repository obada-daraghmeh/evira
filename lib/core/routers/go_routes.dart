import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/category_products/presentation/pages/category_products_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/navigation/presentation/pages/navigation_page.dart';
import '../../features/product_details/presentation/pages/product_details_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../constants/routes_const.dart';
import '../shared/features/entities/category.dart';
import '../shared/features/entities/product.dart';

final _homeShellNavigatorKey = GlobalKey<NavigatorState>();
final _cartShellNavigatorKey = GlobalKey<NavigatorState>();
final _ordersShellNavigatorKey = GlobalKey<NavigatorState>();
final _walletShellNavigatorKey = GlobalKey<NavigatorState>();
final _profileShellNavigatorKey = GlobalKey<NavigatorState>();

List<RouteBase> routes = [
  GoRoute(
    path: PathsConst.signIn,
    name: RoutesConst.signIn,
    builder: (_, _) => const SignInPage(),
  ),
  GoRoute(
    path: PathsConst.signUp,
    name: RoutesConst.signUp,
    builder: (_, _) => const SignUpPage(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        NavigationPage(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        navigatorKey: _homeShellNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: PathsConst.home,
            name: RoutesConst.home,
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _cartShellNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: PathsConst.cart,
            name: RoutesConst.cart,
            builder: (context, state) => const CartPage(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _ordersShellNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: PathsConst.orders,
            name: RoutesConst.orders,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Orders'))),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _walletShellNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: PathsConst.wallet,
            name: RoutesConst.wallet,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Wallet'))),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _profileShellNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: PathsConst.profile,
            name: RoutesConst.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: PathsConst.categoryProducts,
    name: RoutesConst.categoryProducts,
    builder: (context, state) {
      final category = state.extra as Category;
      return CategoryProductsPage(category: category);
    },
  ),
  GoRoute(
    path: PathsConst.productDetails,
    name: RoutesConst.productDetails,
    builder: (context, state) {
      final product = state.extra as Product;
      return ProductDetailsPage(product: product);
    },
  ),
];
