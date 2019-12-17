import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_body.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_entry.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_filter.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_header.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/services/users.service.dart';

 class LeaderboardScreen extends StatefulWidget {
    LeaderboardScreen({Key key}) : super(key: key);
   
   @override
   _LeaderboardScreen createState() => _LeaderboardScreen();
   
   
 }

 class _LeaderboardScreen extends State<LeaderboardScreen> {

  final UserService userService = new UserService();
  User currentUser;
  List<Widget> users;
  final authService = SignInUpService();

  @override
  void initState() {
    super.initState(); 
    refreshUserList("dropdown-national"); 

    authService.currentUser.then((user) {
      currentUser = user;
    });
  }

   @override
    Widget build(BuildContext context) {
    String dropDownSelection = 'dropdown-national';

    void transferInformationFromFilterToBody(String selectedOption) {
      setState(() {
        dropDownSelection = selectedOption;
        refreshUserList(selectedOption); 
      });
    }

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
                  LeaderboardHeader(currentUser: currentUser),
                  LeaderboardFilter(callback: transferInformationFromFilterToBody, dropDownSelection: dropDownSelection,
                  ),
                ],
              ),
            ),
            actions: <Widget>[],
          ),
        ];
      },
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: this.users,
          ),
        ],
      ),
    );
  }

  void refreshUserList(String optionSelected){
    this.users = List<Widget>();
    int index = 0;

    if(optionSelected == 'dropdown-friends'){
      print(' _LeaderboardBodyState-- dropdown-friends');
      // Get friends
      this.userService.findFriends().then((usersList) {
        index = 0;
        print("usersList list: "+usersList.length.toString());
        // Order friednds by score 
        usersList.sort((a, b) => a.points.compareTo(b.points));
        usersList.forEach((user) {
          print("Friend name: "+user.name);
          index = index + 1;
          if(index < 11){
            this.users.add(
              LeaderboardEntry(user: user)
            );
          } else {
            //break;
          }
        });
        setState(() {});
      });

    // Get all users
    } else {
      print(' _LeaderboardBodyState dropdown-National');
      this.userService.getFirstTenRankingUsers().then((usersList) {
        print("usersList list: "+usersList.length.toString());
        index = 0;
        print(usersList);

        usersList.forEach((user) {
          this.users.add(LeaderboardEntry(user: user));
        });
        setState(() {});
      });
    }
  }
 }


