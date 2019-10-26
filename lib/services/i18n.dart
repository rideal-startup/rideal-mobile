import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class I18n {
  final Locale locale;

  I18n(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String ymlString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.yml');
    YamlMap translations = loadYaml(ymlString);
    _localizedStrings = translations.map((key, value) {
      return MapEntry(key, value.toString());
    });
    
    return true;
  }

  String translate(String key, [Map<String, String> params = const {}]) {
    var str = _localizedStrings[key];
    for (var e in params.entries) {
      str = str.replaceAll('{{${e.key}}}', e.value);
    }
    return str;
  }

  static const LocalizationsDelegate<I18n> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<I18n> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<I18n> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    I18n localizations = new I18n(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}