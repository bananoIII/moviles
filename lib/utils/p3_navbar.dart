import 'package:flutter/material.dart';

class P3Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const P3Navbar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.surface;

    final icons = [
      Icons.home,
      Icons.search,
      Icons.explore,
      Icons.airplane_ticket,
      Icons.notifications,
    ];
    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.grey,
                size: 28,
              ),
            ),
          );
        }),
      ),
    );
  }
}
