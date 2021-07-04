// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/application/logging/logger_types.dart';
import 'package:robin/application/navigation/app_router.gr.dart';
import 'package:robin/repositories/auth_repository.dart';

class AuthGuard extends AutoRouteGuard with UtilityLogger {
  final providerContainer = ProviderContainer();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    providerContainer
        .read(authRepositoryProvider)
        .authStateChanges
        .listen((user) {
      logger.info('Logged user -> $user');
      user != null ? resolver.next(true) : router.replace(const LoginRoute());
    });
  }
}
