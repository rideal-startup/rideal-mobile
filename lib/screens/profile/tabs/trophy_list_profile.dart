// SecondScreen.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/screens/profile/widgets/profile_trophy_entry.dart';
import 'package:rideal/services/i18n.dart';

class TrophyListProfile extends StatelessWidget {
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
              Container(
      child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[500],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width*0.95,
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Icon(FontAwesomeIcons.award, size: 30,color:Colors.grey[600] ,),
                  ),
                  
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    )//hintText: I18n.of(context).translate('search-hint')),
              ),
            ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                    child: Icon(FontAwesomeIcons.search, size: 30,color:Colors.grey[600]),
                  ),
              
                ],
              ),
            ),
          ),
    ),
          ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 1",
                    trophyId:"124",
                    state:"Complete",
                    progress: 1.0,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 2",
                    trophyId:"125",
                    state:"Complete",
                    progress: 1.0,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 3",
                    trophyId:"126",
                    state:"Complete",
                    progress: 1.0,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 4",
                    trophyId:"127",
                    state:"InProgress",
                    progress: 0.5,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 5",
                    trophyId:"128",
                    state:"InProgress",
                    progress: 0.7,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 6",
                    trophyId:"129",
                    state:"InProgress",
                    progress: 0.2,
                    ),
                    ProfileTrophyEntry(
                    name: (I18n.of(context).translate("Trophy")).toString()+" 7",
                    trophyId:"130",
                    state:"InProgress",
                    progress: 0.9,
                    ),   
            ],
          ),
        ],
      ),
    );
  }
}