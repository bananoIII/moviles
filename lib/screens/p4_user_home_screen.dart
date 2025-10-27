import 'package:flutter/material.dart';
import 'package:progra_movil/utils/theme_settings.dart';

class P4UserHomeScreen extends StatefulWidget {
  const P4UserHomeScreen({super.key});

  @override
  State<P4UserHomeScreen> createState() => _P4UserHomeScreenState();
}

class _P4UserHomeScreenState extends State<P4UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    //return Container(child: Center(child: Text('user')));
    return Theme(
      data: ThemeSettings.p4AdminTheme(),
      child: Scaffold(body: Stack(children: [Row()])),
    );
  }
}
