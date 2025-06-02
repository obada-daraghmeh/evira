import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/routes_const.dart';
import '../controllers/auth_status/auth_status_cubit.dart';
import '../utils/go_router_refresh.dart';
import 'go_router_redirect.dart';
import 'go_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthStatusCubit authCubit) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: PathsConst.signIn,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: redirectGuard(
      navigatorKey: _rootNavigatorKey,
      authCubit: authCubit,
    ),
    routes: routes,
    errorBuilder: (_, _) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
