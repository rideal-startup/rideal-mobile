import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/widgets/profile_friend_entry.dart';

class FriendsListScreen extends StatefulWidget {
  final List<User> friends;

  const FriendsListScreen({Key key, this.friends}) : super(key: key);
  
  @override
  _FriendsListScreenState createState() => _FriendsListScreenState();

}

class _FriendsListScreenState extends State<FriendsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(FontAwesomeIcons.heart),
            ),
            Text("Friends")
          ],
        ),
      ),
      body: Column(
        children: this.widget.friends.map((f) {
          return ProfileFriendEntry(user: f, state: 'List',);
        }).toList()
      ),
    );
  }
}