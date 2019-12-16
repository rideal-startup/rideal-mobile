import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/widgets/circle_image.dart';

class LeaderboardHeader extends StatelessWidget {
  final User currentUser;

  const LeaderboardHeader({
    Key key,
    this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircleImage(this.currentUser?.photoLink, isUrl: true),
              Text(
                "#15",
                style: TextStyle(fontSize: 45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
