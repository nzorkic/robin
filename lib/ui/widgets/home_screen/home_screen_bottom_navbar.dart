// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/providers.dart';

class HomeScreenBottomNavbar extends StatelessWidget {
  const HomeScreenBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Theme.of(context).accentColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: context.read(bottomNavbarUtilsProvider),
      onTap: (tabId) => context
          .read(bottomNavbarUtilsProvider.notifier)
          .changeActiveTab(tabId),
    );
  }
}
