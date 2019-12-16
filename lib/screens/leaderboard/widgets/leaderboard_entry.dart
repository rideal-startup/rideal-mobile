import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/widgets/circle_image.dart';

class LeaderboardEntry extends StatelessWidget {
  final User user;

  const LeaderboardEntry({Key key, this.user});

  @override
  Widget build(BuildContext context) {
    String fullName = '${user.name} ${user.surname}';

    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleImage(user.photoLink, size: 60, isUrl: true),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(user.username),
              ),
              Text(
                fullName,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  user.points.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CircleImage('assets/images/medal.png', size: 50)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
