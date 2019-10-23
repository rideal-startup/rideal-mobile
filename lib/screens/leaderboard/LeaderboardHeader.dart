import 'package:flutter/material.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 150,
          ),
          Text("#15", style: TextStyle(fontSize: 45),),
        ],
      ),
    );
  }
}