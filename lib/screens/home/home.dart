import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/screens/feed/feed_screen.dart';
import 'package:rideal/screens/home/widgets/bottom_bar.dart';
import 'package:rideal/screens/home/widgets/rideal_drawer.dart';
import 'package:rideal/screens/leaderboard/leaderboard_screen.dart';
import 'package:rideal/screens/map/map.dart';
import 'package:rideal/screens/profile/profile.dart';
import 'package:rideal/widgets/navbar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 1;

  final screens = [FeedScreen(), MapScreen(), LeaderboardScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    final currentScreen = screens[index];

    return Scaffold(
      bottomNavigationBar: BottomNavbar(
        index: index,
        callback: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      drawer: RidealDrawer(
        onProfileNavigation: () {
          setState(() {
            index = 3;
          });
        }
      ),
      body: Container(child: currentScreen),
    );
  }
}
