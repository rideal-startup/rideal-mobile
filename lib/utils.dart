import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rideal/widgets/language_changer.dart';

class FadingRoute<T> extends MaterialPageRoute<T> {
  FadingRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

void changeLanguage(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return LanguageChanger();
    }
  );
}

final localeSubject = BehaviorSubject<Locale>();

Stream<Locale> setLocale(String newLocale) {
  localeSubject.sink.add(Locale(newLocale));
  return localeSubject.stream.distinct() ;
}
