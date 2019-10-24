import 'package:flutter/material.dart';
import 'package:rideal/screens/home/login.dart';
import 'package:rideal/screens/map/map.dart';
import 'package:rideal/widgets/FeedScreen.dart';
import 'package:rideal/services/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rideal/widgets/Navbar.dart';

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
        AppLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
      ),
      home: LoadingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 1;
  // [FeedScreen, MapScreen, LadeboardScreen]
  final screens = [FeedScreen(), MapScreen(), Text("dddd")];

  @override
  Widget build(BuildContext context) {
    final currentScreen = screens[index];

    return Scaffold(
      bottomNavigationBar: Navbar(
        callback: (index) {
          this.setState(() {
            this.index = index;
          });
        },
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
                  onPressed: () {},
                ),
                Text('Profile')
              ])
              ,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Configuración y privacidad'),
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
}
