// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:robin/application/logging/log_pens.dart';
import 'package:robin/application/logging/logger_types.dart';
import 'package:robin/providers.dart';
import 'package:robin/ui/screens/home_screen_pages/posts_screen.dart';
import 'package:robin/ui/widgets/home_screen/home_screen_bottom_navbar.dart';

class HomeScreen extends StatelessWidget with UiLogger {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.info(penInfo('Building HomeScreen...'));
    return Scaffold(
      body: Consumer(
        builder: (_, watch, __) {
          return Center(
            child: _pages.elementAt(
              watch(bottomNavbarUtilsProvider),
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeScreenBottomNavbar(),
    );
  }

  static const List<Widget> _pages = <Widget>[
    PostsScreen(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];
}
