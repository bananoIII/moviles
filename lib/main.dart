import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progra_movil/firebase_options.dart';
import 'package:progra_movil/screens/add_movie_screen.dart';
import 'package:progra_movil/screens/home_screen.dart';
import 'package:progra_movil/screens/list_movies.dart';
import 'package:progra_movil/screens/login_screen.dart';
import 'package:progra_movil/screens/p3_get_started.dart';
import 'package:progra_movil/screens/p3_main_screen.dart';
import 'package:progra_movil/screens/p3_my_flight_details.dart';
import 'package:progra_movil/screens/practica_1_details_screen.dart';
import 'package:progra_movil/screens/practica_1_show_screen.dart';
import 'package:progra_movil/screens/register_screen.dart';
import 'package:progra_movil/utils/theme_settings.dart';
import 'package:progra_movil/utils/value_listener.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

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
            "/register": (context) => RegisterScreen(),
            "/movies/list": (context) => ListMovies(),
            "/movies/add": (context) => AddMovieScreen(),
            "/home/practica3": (context) => getStarted(),
            "/home/practica3/home": (context) => P3MainScreen(),
            "/home/practica3/flight/details": (context) => P3MyFlightDetails(),
          },
          home: LoginScreen(),
        );
      },
    );
  }
}
