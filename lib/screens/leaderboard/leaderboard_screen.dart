import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_body.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_filter.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_header.dart';
import 'package:rideal/services/users.service.dart';



 class LeaderboardScreen extends StatefulWidget {
    LeaderboardScreen({Key key}) : super(key: key);
   
   @override
   _LeaderboardScreen createState() => _LeaderboardScreen();
   
 }

 class _LeaderboardScreen extends State<LeaderboardScreen> {
   //const LeaderboardScreen({Key key}) : super(key: key);
    final UserService userService = new UserService();

  @override
  void initState() {
    super.initState();
  }

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
      body: LeaderboardBody(userService: this.userService),
    );
  }
 }


