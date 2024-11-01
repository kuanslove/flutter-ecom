import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Colors.red[100],
          activeColor: Colors.red,
          // tabActiveBorder: Border.all(color: Colors.red),
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: (value){
            onTabChange!(value);
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "选购",
            ),
            GButton(icon: Icons.shopping_bag, text: "结算"),
          ]),
    );
  }
}
