// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/repositories/auth_repository.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, User?>((ref) => AuthNotifier(ref.read));

class AuthNotifier extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangeSubscription;

  AuthNotifier(this._read) : super(null) {
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
