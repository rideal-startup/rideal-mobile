import 'package:flutter/material.dart';
import 'package:rideal/screens/feed/feed_screen.dart';
import 'package:rideal/screens/home/widgets/bottom_bar.dart';
import 'package:rideal/screens/home/widgets/rideal_drawer.dart';
import 'package:rideal/screens/leaderboard/leaderboard_screen.dart';
import 'package:rideal/screens/map/map.dart';
import 'package:rideal/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  final String title;
  final int index;

  HomePage({Key key, this.title, this.index}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int localIndex = 1;
  bool navigationMode = true;

  final screens = [FeedScreen(), MapScreen(), LeaderboardScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    this.localIndex = readIndex();
    final currentScreen = screens[localIndex];

    return Scaffold(
      bottomNavigationBar: BottomNavbar(
        index: localIndex,
        callback: (localIndex) {
          setState(() {
            this.navigationMode = false;
            this.localIndex = localIndex;
          });
        },
      ),
      drawer: RidealDrawer(
        onProfileNavigation: () {
          setState(() {
            localIndex = 3;
          });
        }
      ),
      body: Container(child: currentScreen),
    );
  }

  int readIndex() {
    if (widget.index != null && widget.index != this.localIndex && this.navigationMode) {
      return widget.index;
    }
    return this.localIndex;
  }
}
