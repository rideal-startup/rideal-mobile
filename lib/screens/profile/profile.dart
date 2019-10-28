import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/screens/profile/tabs/basic_info_profile.dart';
import 'package:rideal/screens/profile/tabs/friends_list_profile.dart';
import 'package:rideal/screens/profile/tabs/trophy_list_profile.dart';
import 'package:rideal/screens/profile/widgets/profile_header.dart';
import 'package:rideal/utils.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: ProfileHeader(),
              ),
              actions: <Widget>[],
            ),
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                TabBar(
                  indicatorWeight: 4,
                  tabs: [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.people)),
                    Tab(icon: Icon(FontAwesomeIcons.award))
                  ],
                ),
              ),
              floating: false,
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: [
            BasicINfoProfile(),
            FriendsListProfile(),
            TrophyListProfile(),
          ],
        ),
      ),
    );
  }
}
