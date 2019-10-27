import 'package:flutter/material.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_entry.dart';
import 'package:rideal/screens/profile/widgets/profile_info_entry.dart';

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
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              //first
          ProfileInfoEntry(
                    header: "E-mail",
                    info: "harrydickinson@gmail.com",
                    icon: Icons.email
                    ),
                    ProfileInfoEntry(
                    header: "City",
                    info: "Lleia",
                    icon: Icons.location_city
                    ),
                    ProfileInfoEntry(
                    header: "Score",
                    info: "100",
                    icon: Icons.score
                    ),
                    ProfileInfoEntry(
                    header: "Mobile",
                    info: "690987654",
                    icon: Icons.phone_android
                    ),
                    ProfileInfoEntry(
                    header: "Friends",
                    info: "12",
                    icon: Icons.people,
                    ),   
            ],
          ),
        ],
      ),
    
    );
  }
}