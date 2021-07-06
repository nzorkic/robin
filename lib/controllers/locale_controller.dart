// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:robin/application/config/app_constants.dart';
import 'package:robin/application/config/storage_constants.dart';
import 'package:robin/application/logging/log_pens.dart';
import 'package:robin/application/logging/logger_types.dart';
import 'package:robin/providers.dart';
import 'package:robin/services/storage_service.dart';
import 'package:robin/utils/locale_utils.dart';

final _settingsData = storageProvider(settingsBoxProvider);

final localeController = StateNotifierProvider<LocaleController, String>((ref) {
  final _currentLocale = ref.read(_settingsData).getStringValue(
      SettingsStorage.CURRENT_LANGUAGE,
      defaultValue: Constants.FALLBACK_LANGUAGE);
  return LocaleController(_currentLocale);
});

class LocaleController extends StateNotifier<String> with UtilityLogger {
  LocaleController(this.currentLocale) : super(currentLocale);

  final String currentLocale;

  changeLocale(BuildContext context, String localeName) {
    String _localeCode = LocaleUtils.getLocaleCodeForName(localeName);
    context
        .read(_settingsData)
        .setStringValue(SettingsStorage.CURRENT_LANGUAGE, _localeCode)
        .whenComplete(
          () => {
            context.setLocale(Locale(_localeCode)),
            state = _localeCode,
            logger.info(penInfo('Locale changed to $_localeCode')),
          },
        )
        .onError((error, stackTrace) =>
            logger.warning(penWarning('Failed to change app theme')));
  }
}
