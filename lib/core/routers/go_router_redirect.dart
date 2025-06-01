import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../constants/routes_const.dart';
import '../controllers/auth_status/auth_status_cubit.dart';
import '../utils/helpers/show_toast.dart';

GoRouterRedirect redirectGuard({
  required GlobalKey<NavigatorState> navigatorKey,
  required AuthStatusCubit authState,
}) {
  return (BuildContext context, GoRouterState state) {
    final isLoggedIn = authState.state is Authenticated;

    // Routes that guests are allowed to access
    const guestAllowedPaths = {PathsConst.signIn, PathsConst.signUp};
    final isGuestPath = guestAllowedPaths.contains(state.matchedLocation);

    if (!isLoggedIn && !isGuestPath) {
      // → User not logged in and tries to access a protected route
      // → redirect to login.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final messengerContext = navigatorKey.currentContext;
        if (messengerContext != null) {
          ShowToast.showErrorToast(
            message: 'Oops! You need to sign in to continue.',
          );
        }
      });

      return PathsConst.navigation;
    }

    if (isLoggedIn && isGuestPath) {
      // → User logged in but tries to access a guest-only route
      // → redirect to home.
      return PathsConst.home;
    }

    return null;
  };
}
