import 'package:flutter/material.dart';
import 'package:progra_movil/screens/home_screen.dart';
import 'package:progra_movil/screens/login_screen.dart';
import 'package:progra_movil/screens/practica_1_details_screen.dart';
import 'package:progra_movil/screens/practica_1_show_screen.dart';
import 'package:progra_movil/utils/theme_settings.dart';
import 'package:progra_movil/utils/value_listener.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isLightTheme,
      builder: (context, value, _) {
        return MaterialApp(
          theme: value ? ThemeSettings.lightTheme() : ThemeSettings.darkTheme(),
          title: 'Material App',
          routes: {
            "/home": (context) => HomeScreen(),
            "/home/practica1": (context) => Practica1ShowScreen(),
            "/home/practica1/details": (context) => Practica1DetailsScreen(),
          },
          home: LoginScreen(),
        );
      },
    );
  }
}
