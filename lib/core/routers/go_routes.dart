import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../constants/routes_const.dart';

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
  GoRoute(
    path: PathsConst.home,
    name: RoutesConst.home,
    builder: (_, _) => const HomePage(),
  ),
];
