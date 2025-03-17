
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
class LangConfig {
 static Locale? localResolutionCallbackFunc(deviceLocale, supportedLocales) {
  for (var locale in supportedLocales) {
    if (deviceLocale != null &&
        deviceLocale.languageCode == locale.languageCode) {
      return deviceLocale;
    }
  }
  return supportedLocales.first;
}

static Iterable<Locale> supportedLocales = [
  const Locale('en'),
  const Locale("ar"),
];
static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

}

