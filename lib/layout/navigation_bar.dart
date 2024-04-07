import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BeStudyingNavigationBar extends StatefulWidget {
  const BeStudyingNavigationBar({super.key, required this.update});

  final ValueChanged<int> update;

  @override
  State<BeStudyingNavigationBar> createState() =>
      _BeStudyingNavigationBarState();
}

class Item {
  final String title;
  final IconData icon;

  Item({required this.title, required this.icon});
}

class _BeStudyingNavigationBarState extends State<BeStudyingNavigationBar>
    with TickerProviderStateMixin {
  late int _menuIndex = 0;
  final autoSizeGroup = AutoSizeGroup();
  final List<Item> itemList = [
    Item(title: 'Atividade', icon: Icons.notifications),
    Item(title: 'Sobre', icon: Icons.settings),
  ];

  late AnimationController _hideBottomBarAnimationController;

  @override
  void initState() {
    super.initState();
    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void updateMenuIndex(int index) {
    setState(() {
      _menuIndex = index;
    });

    widget.update(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: itemList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Colors.blueAccent : Colors.white;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              itemList[index].icon,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                itemList[index].title,
                maxLines: 1,
                style: TextStyle(color: color),
                group: autoSizeGroup,
              ),
            )
          ],
        );
      },
      backgroundColor: const Color.fromRGBO(18, 18, 40, 1),
      activeIndex: _menuIndex,
      gapLocation: GapLocation.center,
      leftCornerRadius: 20,
      rightCornerRadius: 20,
      onTap: (index) => updateMenuIndex(index),
      hideAnimationController: _hideBottomBarAnimationController,
      shadow: const BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 3,
        color: Colors.white,
      ),
    );
  }
}
