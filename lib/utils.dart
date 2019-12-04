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

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}