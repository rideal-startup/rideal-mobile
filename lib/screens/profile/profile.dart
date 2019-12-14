import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/tabs/basic_info_profile.dart';
import 'package:rideal/screens/profile/tabs/friends_list_profile.dart';
import 'package:rideal/screens/profile/tabs/trophy_list_profile.dart';
import 'package:rideal/screens/profile/widgets/profile_editor.dart';
import 'package:rideal/screens/profile/widgets/profile_header.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/utils.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authService = SignInUpService();
  User user;
  bool loadedUser = false;

  @override
  void initState() {
    this.authService.currentUser.then((u) {
      user = u;
      loadedUser = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loadedUser)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[200]),
        ),
      );
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              snap: false,
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    ProfileHeader(currentUser: user),
                    _editProfileButton()
                  ]
                )
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

  Widget _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: SizedBox(
        height: 32,
        width: MediaQuery.of(context).size.width * 0.9,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                side: BorderSide(color: Colors.grey)),
            color: Colors.black87,
            child: Text(
              "Edit Profile",
              style: TextStyle(fontSize: 12),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext _) => ProfileEditor(
                        currentUser: user,
                      )));
            }),
      ),
    );
  }
}
