// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:robin/application/navigation/app_router.gr.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login page'),
            ElevatedButton(
              onPressed: () => context.navigateTo(const HomeRoute()),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
