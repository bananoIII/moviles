import 'package:flutter/material.dart';
import 'package:progra_movil/screens/p3_home.dart';
import 'package:progra_movil/screens/p3_my_flights.dart';
import 'package:progra_movil/utils/p3_navbar.dart';
import 'package:progra_movil/utils/theme_settings.dart';

class P3MainScreen extends StatefulWidget {
  const P3MainScreen({super.key});

  @override
  State<P3MainScreen> createState() => _P3MainScreenState();
}

class _P3MainScreenState extends State<P3MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const P3Home(),
    const P3Home(),
    const P3Home(),
    const P3MyFlights(),
    const P3Home(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeSettings.p3lightTheme(),
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: P3Navbar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
