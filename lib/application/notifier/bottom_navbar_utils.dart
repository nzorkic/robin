// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavbarUtils extends StateNotifier<int> {
  BottomNavbarUtils(int state) : super(state);

  void changeActiveTab(final int tab) => state = tab;
}
