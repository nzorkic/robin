// Package imports:

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/application/config/app_constants.dart';
import 'package:robin/application/config/storage_constants.dart';
import 'package:robin/providers.dart';
import 'package:robin/services/storage_service.dart';

final _settingsData =
    ProviderContainer().read(storageProvider(settingsBoxProvider));

class LocaleUtils {
  LocaleUtils._();

  static const String _fallbackLanguage = Constants.FALLBACK_LANGUAGE;
  static const Map<String, String> _localesMap = Constants.LOCALES;

  static List<String> getLocaleNames() {
    return _localesMap.values.toList();
  }

  static List<String> getLocaleCodes() {
    return _localesMap.keys.toList();
  }

  static String getCurrentLocaleName() {
    return _settingsData.getStringValue(StorageValues.CURRENT_LANGUAGE,
        defaultValue: _localesMap[_fallbackLanguage]!);
  }

  static String getCurrentLocaleCode() {
    var name = _settingsData.getStringValue(StorageValues.CURRENT_LANGUAGE);
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => _fallbackLanguage);
  }

  static String getLocaleCodeForName(String? name) {
    if (name == null) {
      return _fallbackLanguage;
    }
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => _fallbackLanguage);
  }
}
