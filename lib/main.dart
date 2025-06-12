import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import 'core/controllers/auth_status/auth_status_cubit.dart';
import 'core/controllers/cart/cart_bloc.dart';
import 'core/controllers/theme_mode/theme_mode_cubit.dart';
import 'core/localization/generated/l10n.dart';
import 'core/routers/go_router.dart';
import 'core/services/get_it_service.dart';
import 'core/theme/theme.dart';
import 'core/utils/controllers/bloc_observer.dart';
import 'core/utils/create_text_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetItService().init;
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeModeCubit>()),
        BlocProvider(create: (_) => getIt<AuthStatusCubit>()),
        BlocProvider(create: (_) => getIt<AuthBloc>()..add(AuthCheckStatus())),
        BlocProvider(create: (_) => getIt<CartBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = createTextTheme(
      context,
      "Urbanist",
      "Urbanist",
    );
    final MaterialTheme theme = MaterialTheme(textTheme);
    final GoRouter router = createRouter(context.read<AuthStatusCubit>());

    return ToastificationWrapper(
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Evira',
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: themeMode,
            routerConfig: router,
            locale: const Locale('en'),
            localizationsDelegates: [
              FlutterIntl.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: FlutterIntl.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
