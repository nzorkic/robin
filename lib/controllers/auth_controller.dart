// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../repositories/auth_repository.dart';

final authController = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangeSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangeSubscription?.cancel();
    _authStateChangeSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangeSubscription?.cancel();
    super.dispose();
  }

  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }
}
