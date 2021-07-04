// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/application/navigation/app_router.gr.dart';
import 'package:robin/repositories/auth_repository.dart';

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
              onPressed: () async => {
                await context.read(authRepositoryProvider).signInAnonymously(),
                context.pushRoute(const HomeRoute()),
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
