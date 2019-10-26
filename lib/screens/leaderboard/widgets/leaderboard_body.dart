import 'package:flutter/material.dart';

import 'leaderboard_entry.dart';

class LeaderboardBody extends StatefulWidget {
  const LeaderboardBody({Key key}) : super(key: key);

  @override
  _LeaderboardBodyState createState() => _LeaderboardBodyState();
}

class _LeaderboardBodyState extends State<LeaderboardBody> {
  @override
  Widget build(BuildContext context) {
    final List<String> users = <String>[
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
    ];
    final List<String> punctuations = <String>[
      "15000",
      "15000",
      "15000",
    ];
    return Expanded(
      flex: 1,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              for (int index = 0; index < users.length; index++)
                LeaderboardEntry(
                    index: (index+1).toString(),
                    userName: users[index],
                    punctuation: punctuations[index])
            ],
          ),
        ],
      ),
    );
  }
}
