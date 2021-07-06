// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final storageProvider = Provider.autoDispose
    .family<StorageService, Provider<Box<dynamic>>>((ref, box) {
  final _hiveBox = ref.watch(box);
  return StorageService(box: _hiveBox);
});

class StorageService {
  StorageService({
    required this.box,
  });

  final Box box;

  bool getBoolValue(String key, {bool defaultValue = false}) {
    return box.get(key, defaultValue: defaultValue);
  }

  Future<void> setBoolValue(String key, bool value) async {
    return await box.put(key, value);
  }

  String getStringValue(String key, {String defaultValue = ''}) {
    return box.get(key, defaultValue: defaultValue);
  }

  Future<void> setStringValue(String key, String value) async {
    return await box.put(key, value);
  }

  int getIntValue(String key, {int defaultValue = 0}) {
    return box.get(key, defaultValue: defaultValue);
  }

  Future<void> setIntValue(String key, int value) async {
    return await box.put(key, value);
  }
}
