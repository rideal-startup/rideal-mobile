import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/LeaderboardBody.dart';
import 'package:rideal/screens/leaderboard/LeaderboardHeader.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          LeaderboardHeader(),
          LeaderboardBody(),
        ],
      ),
    );
  }
}
