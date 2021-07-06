// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/application/config/storage_constants.dart';
import 'package:robin/application/logging/log_pens.dart';
import 'package:robin/application/logging/logger_types.dart';
import 'package:robin/providers.dart';
import 'package:robin/services/storage_service.dart';

final _settingsData = storageProvider(settingsBoxProvider);

final themeController = StateNotifierProvider<ThemeController, bool>((ref) {
  final _isDarkModeEnabled =
      ref.read(_settingsData).getBoolValue(SettingsStorage.DARK_THEME_ENABLED);
  return ThemeController(_isDarkModeEnabled);
});

class ThemeController extends StateNotifier<bool> with UtilityLogger {
  ThemeController(this.isDarkTheme) : super(isDarkTheme);

  final bool isDarkTheme;

  void toggleTheme(BuildContext context) {
    final _isDarkThemeEnabled = context
        .read(_settingsData)
        .getBoolValue(SettingsStorage.DARK_THEME_ENABLED);
    final _toggleValue = !_isDarkThemeEnabled;

    context
        .read(_settingsData)
        .setBoolValue(SettingsStorage.DARK_THEME_ENABLED, _toggleValue)
        .whenComplete(() => {
              state = _toggleValue,
              logger.info(penInfo(
                  'Changed app theme to ${_toggleValue ? 'dark' : 'light'}'))
            })
        .onError((err, stackTrace) =>
            logger.warning(penWarning('Failed to change app theme')));
  }
}
