import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_entry.dart';

class BasicINfoProfile extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
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
    ),
    );
  }
}