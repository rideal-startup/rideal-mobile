// main.dart

import 'package:flutter/material.dart';
import 'package:rideal/screens/profile/tabs/basic_info_profile.dart';
import 'package:rideal/screens/profile/tabs/friends_list_profile.dart';
import 'package:rideal/screens/profile/tabs/trophy_list_profile.dart';


void main() {
  runApp(ProfileBody());
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Expanded(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: AppBar(
              flexibleSpace: Center(
                child: TabBar(  
                  isScrollable: true,
                  tabs: [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.people)),
                    Tab(icon: Icon(Icons.monetization_on))
                  ],
                ),
              ),
            )),
            body: TabBarView(
              children: [
              BasicINfoProfile(),
              FriendsListProfile(),
              TrophyListProfile(),
              ],
            ),
          ),
        ),
      );
  }
}