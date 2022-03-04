import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/components/theme_app.dart';
import 'package:pokemon/routes/MyRoutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyRoutes _myRoutes = MyRoutes();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        dark: ThemeApp.dark,
        light: ThemeApp.light,
        initial: AdaptiveThemeMode.dark,
        builder: (light, dark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            title: 'Pokémon',
            initialRoute: '/splash',
            onGenerateRoute: _myRoutes.onGenerateRoutes,
          );
        });
  }
}
