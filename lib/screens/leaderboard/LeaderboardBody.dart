import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/LeaderboardEntry.dart';

class LeaderboardBody extends StatelessWidget {
  const LeaderboardBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> users = <String>[
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales",
      "Jorge Nitales"
    ];
    final List<String> punctuations = <String>[
      "15000",
      "15000",
      "15000",
      "15000",
      "15000",
      "15000",
      "15000",
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
                    index: index.toString(),
                    userName: users[index],
                    punctuation: punctuations[index])
            ],
          ),
        ],
      ),
    );
  }
}
