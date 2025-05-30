import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/controllers/theme_mode/theme_mode_cubit.dart';
import 'core/services/get_it_service.dart';
import 'core/services/storage_service.dart';
import 'core/theme/theme.dart';
import 'core/utils/controllers/bloc_observer.dart';
import 'core/utils/create_text_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        return MaterialApp(
          title: 'Evira',
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: themeMode,
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Test Toggle Theme
                  Text('Welcome to Evira'),
                  Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeModeCubit>().toggleThemeMode;
                    },
                  ),
                ],
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
