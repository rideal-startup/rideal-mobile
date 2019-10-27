import 'package:flutter/material.dart';
import 'package:rideal/screens/feed/feed_screen.dart';
import 'package:rideal/screens/home/login.dart';
import 'package:rideal/screens/leaderboard/leaderboard_screen.dart';
import 'package:rideal/screens/map/map.dart';
import 'package:rideal/screens/profile/profile.dart';
import 'package:rideal/theme/theme.dart';
import 'package:rideal/services/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rideal/widgets/navBar/curved_navigation_bar.dart';

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

class MyHomePage extends StatefulWidget {
  final String title;
  final int index;

  MyHomePage({Key key, this.title, this.index}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }
  
  int localIndex = 1;
  bool navigationMode = true;

  // [FeedScreen, MapScreen, LadeboardScreen]
  final screens = [FeedScreen(), MapScreen(), LeaderboardScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    this.localIndex = readIndex(this.navigationMode);
    final currentScreen = screens[localIndex];

    return Scaffold(
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width+(MediaQuery.of(context).size.width/4),
          child: CurvedNavigationBar(
            color: Colors.grey[900],
            index: localIndex,
            backgroundColor: Colors.transparent,
            items: <Widget>[
              Icon(Icons.supervised_user_circle,size: 30,color: Colors.pink[200]),
              Icon(Icons.pin_drop, size: 30, color: Colors.pink[200]),
              Icon(Icons.monetization_on, size: 30, color: Colors.pink[200]),
              Icon(Icons.monetization_on, size: 30, color: Colors.red[200]),
            ],
            onTap: (index) {
              print("Pressing navbar: ${this.localIndex}");
              this.setState(() {
                this.navigationMode = false;
                this.localIndex = index;
              });
            },
          ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:Column(children: <Widget>[
                IconButton(
                  iconSize: 100,
                  splashColor: Colors.grey,
                  icon: Icon(Icons.people),
                  onPressed: () {
                    this.setState(() {
                     this.setState(() {this.localIndex = 3; });
                    });
                  },
                ),
                Text('Profile')
              ])
              ,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Configuraci�n y privacidad'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Centro de Ayuda'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(child: currentScreen),
    );
  }

  int readIndex(bool navigationMode) {
    if (widget.index != null && widget.index != this.localIndex && this.navigationMode) {
      return widget.index;
    }
    return this.localIndex;
  }
}
