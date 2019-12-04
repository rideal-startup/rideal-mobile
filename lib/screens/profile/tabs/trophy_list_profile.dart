// SecondScreen.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/widgets/icon_card.dart';

class TrophyListProfile extends StatelessWidget {
  final image = Image.asset(
    "assets/images/medal.png",
    width: 40,
  );

  final challenges = [
    {
      'name': 'Challenge',
      'difficult': 'GOLD',
      'image': Image.asset(
        "assets/images/medal.png",
        width: 40,
      )
    },
    {
      'name': 'Challenge',
      'difficult': 'GOLD',
      'image': Image.asset(
        "assets/images/medal.png",
        width: 40,
      )
    },
    {
      'name': 'Challenge',
      'difficult': 'GOLD',
      'image': Image.asset(
        "assets/images/medal.png",
        width: 40,
      )
    },
    {
      'name': 'Challenge',
      'difficult': 'GOLD',
      'image': Image.asset(
        "assets/images/medal.png",
        width: 40,
      )
    },
    {
      'name': 'Challenge',
      'difficult': 'GOLD',
      'image': Image.asset(
        "assets/images/medal.png",
        width: 40,
      )
    },
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Icon(
                            FontAwesomeIcons.award,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                        ),
                        Expanded(
                          child: TextField(
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                              ) //hintText: I18n.of(context).translate('search-hint')),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                          child: Icon(FontAwesomeIcons.search,
                              size: 30, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  for (var i = 0; i <= this.challenges.length; i += 2) 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: this.challenges
                                  .sublist(i, min(i + 2, this.challenges.length))
                                  .map(_trophy).toList()
                    )
                ],
              ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 1",
              //   trophyId: "124",
              //   state: "Complete",
              //   progress: 1.0,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 2",
              //   trophyId: "125",
              //   state: "Complete",
              //   progress: 1.0,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 3",
              //   trophyId: "126",
              //   state: "Complete",
              //   progress: 1.0,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 4",
              //   trophyId: "127",
              //   state: "InProgress",
              //   progress: 0.5,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 5",
              //   trophyId: "128",
              //   state: "InProgress",
              //   progress: 0.7,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 6",
              //   trophyId: "129",
              //   state: "InProgress",
              //   progress: 0.2,
              // ),
              // ProfileTrophyEntry(
              //   name: (I18n.of(context).translate("Trophy")).toString() + " 7",
              //   trophyId: "130",
              //   state: "InProgress",
              //   progress: 0.9,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _trophy(Map<String, dynamic> prize) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: IconCard(
        icon: prize['image'],
        startColor: Color.fromARGB(255, 250, 125, 130),
        endColor: Color.fromARGB(255, 255, 178, 149),
        child: Column(
            children: <Widget>[
              Text(
                prize['name'], 
                style: TextStyle(fontSize: 20),
              ),
              Container(
                alignment: Alignment(0, 1.0),
                width: 120,
                // height: 30,
                // padding: EdgeInsets.only(top: 20),
                // color: Colors.black,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'View more ', 
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.right,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Icon(FontAwesomeIcons.eye, size: 10,),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
