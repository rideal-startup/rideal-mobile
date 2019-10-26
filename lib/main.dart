import 'package:flutter/material.dart';
import 'package:rideal/screens/loading/loading.dart';
import 'package:rideal/theme/theme.dart';
import 'package:rideal/services/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        I18n.delegate
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale.languageCode &&
      //         supportedLocale.countryCode == locale.countryCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      title: 'Flutter Demo',
      theme: appTheme(),
      home: LoadingScreen(),
    );
  }
}