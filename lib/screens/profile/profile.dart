import 'package:flutter/material.dart';
import 'package:rideal/screens/profile/widgets/profile_header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

        return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          ProfileHeader(),
        ],
      ),
    );

  }
}


