import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rideal/services/users.service.dart';

import 'leaderboard_entry.dart';


final GlobalKey<_LeaderboardBodyState> _myWidgetState = GlobalKey<_LeaderboardBodyState>();
class LeaderboardBody extends StatefulWidget {

  LeaderboardBody({Key key, this.userService, this.dropDownSelection}) : super(key: key);
  final UserService userService;
  String dropDownSelection;

  @override
  _LeaderboardBodyState createState() => _LeaderboardBodyState();

  void refreshUsersList(String selectedOption){
    print("Al body arrive: "+selectedOption);
    
    //_myWidgetState?.currentState?.refreshUserList();
  }
}



class _LeaderboardBodyState extends State<LeaderboardBody> {
  
  List<Widget> users;

  @override
  void initState() {
    super.initState(); 
    refreshUserList();  
  }
  


  void refreshUserList(){
    this.users =  new List<Widget>();
    int index = 0;

    if(this.widget.dropDownSelection == 'dropdown-friends'){
      print(' _LeaderboardBodyState-- dropdown-friends');
      // Get friends
      this.widget.userService.findFriends().then((usersList) {
        index = 0;
        print("usersList list: "+usersList.length.toString());
        // Order friednds by score 
        usersList.sort((a, b) => a.points.compareTo(b.points));
        usersList.forEach((user)=>{
          print("Friend name: "+user.name),
          index = index + 1,
          if(index < 11){
            this.users.add(
              LeaderboardEntry(
              index: (index).toString(),
              userName: user.name,
              punctuation: user.points.toString()
              )
            ),
          }else{
            //break;
          }
        });
        setState(() {});
      });

    // Get all users
    } else {
      print(' _LeaderboardBodyState dropdown-National');
      this.widget.userService.getFirstTenRankingUsers().then((usersList) {
        print("usersList list: "+usersList.length.toString());
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
        });
        setState(() {});
      });
    }

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
