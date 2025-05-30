import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../constants/routes_const.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _homeShellNavigatorKey = GlobalKey<NavigatorState>();
// final _cartShellNavigatorKey = GlobalKey<NavigatorState>();
// final _ordersShellNavigatorKey = GlobalKey<NavigatorState>();
// final _walletShellNavigatorKey = GlobalKey<NavigatorState>();
// final _profileShellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: PathsConst.signIn,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     return NavigationPage(navigationShell: navigationShell);
    //   },
    //   branches: [
    //     StatefulShellBranch(
    //       navigatorKey: _homeShellNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: PathsConst.home,
    //           name: RoutesConst.home,
    //           builder: (context, state) => const HomePage(),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       navigatorKey: _cartShellNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: PathsConst.cart,
    //           name: RoutesConst.cart,
    //           builder: (context, state) => const CartPage(),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       navigatorKey: _ordersShellNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: PathsConst.orders,
    //           name: RoutesConst.orders,
    //           builder:
    //               (context, state) =>
    //                   const Scaffold(body: Center(child: Text('Orders'))),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       navigatorKey: _walletShellNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: PathsConst.wallet,
    //           name: RoutesConst.wallet,
    //           builder:
    //               (context, state) =>
    //                   const Scaffold(body: Center(child: Text('Wallet'))),
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       navigatorKey: _profileShellNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: PathsConst.profile,
    //           name: RoutesConst.profile,
    //           builder: (context, state) => const ProfilePage(),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    GoRoute(
      path: PathsConst.signIn,
      name: RoutesConst.signIn,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: PathsConst.signUp,
      name: RoutesConst.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    // GoRoute(
    //   path: PathsConst.search,
    //   name: RoutesConst.search,
    //   builder: (context, state) => const SearchPage(),
    // ),
    // GoRoute(
    //   path: PathsConst.categoryProducts,
    //   name: RoutesConst.categoryProducts,
    //   builder: (context, state) {
    //     final category = state.extra as Category;
    //     return CategoryProductsPage(category: category);
    //   },
    // ),
    // GoRoute(
    //   path: PathsConst.productDetails,
    //   name: RoutesConst.productDetails,
    //   builder: (context, state) {
    //     final product = state.extra as Product;
    //     return ProductDetailsPage(product: product);
    //   },
    // ),
    // GoRoute(
    //   path: PathsConst.settings,
    //   name: RoutesConst.settings,
    //   builder: (context, state) => const SettingsPage(),
    // ),
    // GoRoute(
    //   path: PathsConst.editProfile,
    //   name: RoutesConst.editProfile,
    //   builder: (context, state) => const EditProfilePage(),
    // ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page not found'))),
);
