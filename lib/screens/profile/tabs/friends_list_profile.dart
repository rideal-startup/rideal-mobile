// SecondScreen.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/widgets/profile_friend_entry.dart';
import 'package:rideal/services/users.service.dart';

class FriendsListProfile extends StatefulWidget {

  final List<User> requests;
  final Function updateState;

  const FriendsListProfile({Key key, this.requests, this.updateState}) : super(key: key);

  @override
  _FriendsListProfileState createState() => _FriendsListProfileState();
}

class _FriendsListProfileState extends State<FriendsListProfile> {
  final userService = UserService();
  bool searchMode = false;
  final ctrl = new TextEditingController();
  // Find new users
  Timer _queryTimeout;
  List<User> foundUsers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              _searchBar(),
              searchMode ? _searchMode() : _requestsMode()
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[500],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
        ),
        width: MediaQuery.of(context).size.width * 0.95,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(
                Icons.person_add,
                size: 40,
                color: Colors.grey[600],
              ),
            ),
            Expanded(
              child: TextField(
                controller: ctrl,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),
                ),
                onChanged: _findFriends,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: Icon(Icons.add,
                  size: 40, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchMode() {
    if (foundUsers.length == 0)
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "No users found with this username",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.grey,
            fontSize: 16
          ),
        ),
      );

      return Column(
        children: this.foundUsers.map((u) {
          return ProfileFriendEntry(
            user: u,
            state: "None",
            onAdd: () {
              this.userService.sendRequest(u.id).then((_) {
                Fluttertoast.showToast(
                  msg: "Request sent correctly",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0
                );
                ctrl.text="";
                this.searchMode = false;
                setState(() {
                  
                });
                this.widget.updateState();

              });
            },
          );
        }).toList()
      );
  }

  Widget _requestsMode() {
    if (this.widget.requests.length == 0)
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "No pending requests",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.grey,
            fontSize: 16
          ),
        ),
      );

    return Column(
      children: this.widget.requests.map((u) {
        return ProfileFriendEntry(
          user: u,
          state: "Pending",
          onCancel: () {
            this.userService.cancelRequest(u.id).then((_){
              this.widget.updateState();
            });
          },
          onAccept: () {
            this.userService.acceptRequest(u.id).then((_){
              this.widget.updateState();
            });
          },
        );
      }).toList()
    );
  }

  void _findFriends(String text) {
    searchMode = text != '';
    _queryTimeout?.cancel();

    final duration = Duration(milliseconds: 300);
    _queryTimeout = Timer(duration, () async {
      this.foundUsers = await this.userService.findByUsername(text);
      setState(() {});
    });
  }
}
