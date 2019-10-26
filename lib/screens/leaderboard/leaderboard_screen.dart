import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_body.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_filter.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_header.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          LeaderboardHeader(),
          LeaderboardFilter(),
          LeaderboardBody(),
        ],
      ),
    );
  }
}
