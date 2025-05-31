import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/controllers/theme_mode/theme_mode_cubit.dart';
import 'core/localization/generated/l10n.dart';
import 'core/routers/go_router.dart';
import 'core/services/get_it_service.dart';
import 'core/services/storage_service.dart';
import 'core/theme/theme.dart';
import 'core/utils/controllers/bloc_observer.dart';
import 'core/utils/create_text_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetItService().init();
  await StorageService().init();
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<ThemeModeCubit>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");
    MaterialTheme theme = MaterialTheme(textTheme);

    return BlocBuilder<ThemeModeCubit, ThemeMode>(
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
    );
  }
}
