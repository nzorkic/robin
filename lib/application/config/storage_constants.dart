abstract class Storages {
  Storages._();
  static const String SETTINGS_STORAGE = 'settings';
}

abstract class SettingsStorage {
  SettingsStorage._();
  static const String DARK_THEME_ENABLED = 'darkThemeEnabled';
  static const String CURRENT_LANGUAGE = 'language';
}
