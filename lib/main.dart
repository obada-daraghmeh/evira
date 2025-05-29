import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'core/utils/create_text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Evira',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: Text('Welcome to Evira'))),
    );
  }
}
