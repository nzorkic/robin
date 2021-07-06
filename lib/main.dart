// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:robin/application/config/app_constants.dart';
import 'package:robin/application/config/storage_constants.dart';
import 'package:robin/application/init_log.dart';
import 'package:robin/application/logging/log_pens.dart';
import 'package:robin/application/logging/logger_types.dart';
import 'package:robin/application/navigation/app_router.gr.dart';
import 'package:robin/application/navigation/auth_guard.dart';
import 'package:robin/application/rs_delegate.dart';
import 'package:robin/application/theme.dart';
import 'package:robin/controllers/theme_controller.dart';
import 'package:robin/providers.dart';
import 'package:robin/utils/locale_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  await Hive.initFlutter();
  Box settingsBox = await Hive.openBox(Storages.SETTINGS_STORAGE);
  initLog();
  logFunction('main').info(penInfo('initialization completed!'));
  runApp(
    ProviderScope(
      overrides: [
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: EasyLocalization(
        path: Constants.TRANSLATIONS_PATH,
        supportedLocales:
            LocaleUtils.getLocaleCodes().map((lang) => Locale(lang)).toList(),
        useFallbackTranslations: true,
        fallbackLocale: const Locale(Constants.FALLBACK_LANGUAGE),
        child: Robin(),
      ),
    ),
  );
}

class Robin extends ConsumerWidget {
  final _appRouter = AppRouter(authGuard: AuthGuard());

  Robin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bool _appThemeState = watch(themeController);

    return MaterialApp.router(
      theme:
          context.read(themeProvider).getAppThemeData(context, _appThemeState),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...context.localizationDelegates,
        MaterialLocalizationRsDelegate()
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
