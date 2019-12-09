import 'package:flutter/material.dart';
import 'package:rideal/screens/login/login.dart';
import 'package:rideal/theme/theme.dart';
import 'package:rideal/services/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rideal/utils.dart';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: localeSubject.stream,
      initialData: Locale(ui.window.locale.languageCode),
      builder: (context, snapshot) {
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
          locale: snapshot.data,
          title: 'Rideal',
          theme: appTheme(),
          home: LoginPage(),
        );
      }
    );
  }
}