import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/tabs/basic_info_profile.dart';
import 'package:rideal/screens/profile/tabs/friends_list_profile.dart';
import 'package:rideal/screens/profile/tabs/trophy_list_profile.dart';
import 'package:rideal/screens/profile/widgets/profile_editor.dart';
import 'package:rideal/screens/profile/widgets/profile_friends_list.dart';
import 'package:rideal/screens/profile/widgets/profile_header.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/services/users.service.dart';
import 'package:rideal/utils.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Services
  final authService = SignInUpService();
  final userService = UserService();
  
  // Widget data
  User user;
  List<User> friends;
  List<User> requests;

  bool loadedUser = false;

  @override
  void initState() {
    this._fetchData().then((_) {
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
      length: 2,
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
                    ProfileHeader(
                      currentUser: user,
                      nFriends: this.friends.length,
                      onFriendsTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext _) => FriendsListScreen(
                            friends: this.friends,
                          )
                        ));
                      },
                    ),
                    _editProfileButton()
                  ]
                )
              ),
              actions: <Widget>[],
            ),
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                TabBar(
                  indicatorWeight: 2,
                  tabs: [
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
            FriendsListProfile(
              requests: this.requests, 
              updateState: () {
                _fetchData().then((_) {
                  setState(() {
                  });
                });
              },),
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

  Future<void> _fetchData() async {
    this.user = await this.authService.currentUser;
    this.friends = await this.userService.findFriends();
    this.requests = await this.userService.findRequests();
  }
}
