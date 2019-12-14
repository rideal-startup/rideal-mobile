import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rideal/services/users.service.dart';

import 'leaderboard_entry.dart';

class LeaderboardBody extends StatefulWidget {
  LeaderboardBody({Key key, this.userService}) : super(key: key);
  final UserService userService;
  
  @override
  _LeaderboardBodyState createState() => _LeaderboardBodyState();
}

class _LeaderboardBodyState extends State<LeaderboardBody> {

  List<Widget> users = null;

  @override
  void initState() {
    super.initState();
    
    this.users =  new List<Widget>();
    int index = 0;

      this.widget.userService.getFirstTenRankingUsers().then((usersList) {
        index = 0;
        usersList.forEach((user)=>{
         
          index = index + 1,
          this.users.add(
            LeaderboardEntry(
            index: (index).toString(),
            userName: user.name,
            punctuation: user.points.toString()
            )
          ),

          print('user.name: '),
          print(this.users),
        });
        setState(() {});
      });
  }
  
  @override
  Widget build(BuildContext context) {

     
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: 
              this.users,
              
            
          ),
        ],
      ),
    );
  }
}
