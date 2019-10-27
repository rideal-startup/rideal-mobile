import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/screens/leaderboard/widgets/leaderboard_entry.dart';
import 'package:rideal/screens/profile/widgets/profile_info_entry.dart';
import 'package:rideal/services/i18n.dart';

class BasicINfoProfile extends StatelessWidget {

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
                    header: I18n.of(context).translate("E-mail"),
                    info: "harrydickinson@gmail.com",
                    icon: Icons.email
                    ),
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("City"),
                    info: "Lleida",
                    icon: Icons.location_city
                    ),
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("Score"),
                    info: "100",
                    icon: Icons.score
                    ),
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("Mobile"),
                    info: "690987654",
                    icon: Icons.phone_android
                    ),
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("Friends"),
                    info: "5",
                    icon: Icons.people,
                    ),
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("Trophys"),
                    info: "3",
                    icon: FontAwesomeIcons.award,
                    ), 
                    ProfileInfoEntry(
                    header: I18n.of(context).translate("Transports-rided"),
                    info: "43",
                    icon: Icons.train,
                    ),   
            ],
          ),
        ],
      ),
    
    );
  }
}