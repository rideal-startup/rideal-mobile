import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  int localIndex = 1;
  bool navigationMode = true;
  final _fcm = FirebaseMessaging();
  final _db = Firestore.instance;

  final screens = [FeedScreen(), MapScreen(), LeaderboardScreen(), Profile()];

  @override
  void initState() {
    _saveDeviceToken();
    super.initState();
  }

  _saveDeviceToken() async {
    // Get the current user
    String uid = 'guillem'; // TODO: Logged user

    // Get the token for this device
    String fcmToken = await _fcm.getToken();
    _fcm.subscribeToTopic('rideal');
    
    // Save it to Firestore
    if (fcmToken != null) {
      await _db
          .collection('users')
          .document(uid)
          .setData({
            'token': fcmToken,
            'createdAt': FieldValue.serverTimestamp(), // optional
            'platform': Platform.operatingSystem // optional
          });
    }
  }

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
