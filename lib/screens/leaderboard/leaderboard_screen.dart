import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_body.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_filter.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_header.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { 
        return [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  LeaderboardHeader(),
                  LeaderboardFilter(),
                ],
              ),
            ),
            actions: <Widget>[],
          ),
        ];
      },
      body: LeaderboardBody(),
    );
  }
}
