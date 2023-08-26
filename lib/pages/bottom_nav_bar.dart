import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/add/add_screen.dart';
import 'package:lost_and_found/pages/found_screen.dart';
import 'package:lost_and_found/pages/lost_ screen.dart';
import 'package:lost_and_found/pages/message/message/message_screen.dart';
import 'package:lost_and_found/pages/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   final pages = [
         LostScreen(),
      const FoundScreen(),
      AddScreen(),
      MessageScreen(),
       ProfileScreen()
  ];
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          onTap: (int ind) {
            _currentIndex = ind;
            setState(() {});
          },

          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(color: Colors.green),
          unselectedLabelStyle: const TextStyle(color: Colors.red),

          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: "LOST"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.flourescent,
                ),
                label: "FOUND"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_rounded,
                ),
                label: "ADD"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                ),
                label: "CHAT"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "PROFILE"),
          ]),

      body: Container(
        child: pages[_currentIndex],
      )

    );
  }
}