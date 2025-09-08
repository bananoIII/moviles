import 'package:flutter/material.dart';
import 'package:progra_movil/utils/value_listener.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          /*          SafeArea(
            child: SwitchListTile(
              title: const Text('Colorful Nav bar'),
              value: _colorful,
              onChanged: (bool value) {
                setState(() {
                  _colorful = !_colorful;
                });
              },
            ),
          ),*/
          AppBar(
            backgroundColor: Colors.blueGrey,

            actions: [
              ValueListenableBuilder(
                valueListenable: ValueListener.isLightTheme,
                builder: (context, value, child) {
                  return value
                      ? IconButton(
                          icon: Icon(Icons.nightlight),
                          onPressed: () {
                            ValueListener.isLightTheme.value = false;
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.sunny),
                          onPressed: () {
                            ValueListener.isLightTheme.value = true;
                          },
                        );
                },
              ),
            ],
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Práctica 1'),
              onTap: () {
                Navigator.pushNamed(context, '/home/practica1');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _colorful
          ? SlidingClippedNavBar.colorful(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              // activeColor: const Color(0xFF01579B),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.event,
                  title: 'Events',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.orange,
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: 'Search',
                  activeColor: Colors.yellow,
                  inactiveColor: Colors.green,
                ),
                BarItem(
                  icon: Icons.bolt_rounded,
                  title: 'Energy',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.red,
                ),
                BarItem(
                  icon: Icons.tune_rounded,
                  title: 'Settings',
                  activeColor: Colors.cyan,
                  inactiveColor: Colors.purple,
                ),
              ],
            )
          : SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor: const Color(0xFF01579B),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(icon: Icons.event, title: 'Events'),
                BarItem(icon: Icons.search_rounded, title: 'Search'),
                BarItem(icon: Icons.bolt_rounded, title: 'Energy'),
                BarItem(icon: Icons.tune_rounded, title: 'Settings'),
              ],
            ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  Container(
    alignment: Alignment.center,
    child: const Icon(Icons.event, size: 56, color: Colors.brown),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(Icons.search, size: 56, color: Colors.brown),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(Icons.bolt, size: 56, color: Colors.brown),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(Icons.tune_rounded, size: 56, color: Colors.brown),
  ),
];
