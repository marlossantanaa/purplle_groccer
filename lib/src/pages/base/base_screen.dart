import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() {
    return _BaseScreenState();
  }
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  var _selectedTab = _SelectedTab.home;
  void handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              child: const HomeTab(),
              color: Colors.transparent,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            margin: const EdgeInsets.only(left: 10, right: 10),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.purple,
            unselectedItemColor: Colors.grey[300],
            onTap: (handleIndexChanged) {
              setState(() {
                pageController.jumpToPage(handleIndexChanged);
              });
            },
            // enableFloatingNavBar: false,

            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(Iconsax.home),
                selectedColor: const Color(0xff73544C),
              ),

              /// Likes
              DotNavigationBarItem(
                icon: const Icon(Iconsax.shopping_cart),
                selectedColor: const Color(0xff73544C),
              ),

              /// Search
              DotNavigationBarItem(
                icon: const Icon(Icons.list),
                selectedColor: const Color(0xff73544C),
              ),

              /// Profile
              DotNavigationBarItem(
                icon: const Icon(Icons.person),
                selectedColor: const Color(0xff73544C),
              ),
            ],
          ),
        ));
  }
}

enum _SelectedTab { home, favorite, list, person }
