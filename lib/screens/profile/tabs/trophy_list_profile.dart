// SecondScreen.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/challenge-pack.dart';
import 'package:rideal/screens/profile/widgets/profile_trophy_entry.dart';
import 'package:rideal/services/challenge.service.dart';
import 'package:rideal/services/i18n.dart';

class TrophyListProfile extends StatefulWidget {
  @override
  _TrophyListProfileState createState() => _TrophyListProfileState();
}


class _TrophyListProfileState extends State<TrophyListProfile> {
  ChallengeService challengeService = ChallengeService();
  //List<ChallengePack> listChallengePack = [];
  List<Widget> challengWidget;

  @override
  void initState() {
    super.initState();
    this.challengWidget =  new List<Widget>();
    challengeService.getAllChallengs().then((list) {
      print("CHALLENG RECIEVED ");
      list.forEach((challeng)=>{
        print("ProfileTrophyEntry created: "+challeng.challenge.name),
       
        if(challeng.points == null){
          challengWidget.add(ProfileTrophyEntry(
                      name: challeng?.challenge?.name,
                      trophyId: challeng?.challenge?.id,
                      state: "New",
                      progress: 11.toDouble(),//challeng.points,
                      challenge: challeng.challenge,
          ))
        }else if(challeng.progres == 100){
          challengWidget.add(ProfileTrophyEntry(
                      name: challeng.challenge.name,
                      trophyId: challeng.challenge.id,
                      state: "Complete",
                      progress: 11.0,//challeng.challenge.goal,
                      challenge: challeng.challenge,
          ))
        }else{
          challengWidget.add(ProfileTrophyEntry(
                      name: challeng.challenge.name,
                      trophyId: challeng.challenge.id,
                      state: "InProgress",
                      progress: 0.0,
                      challenge: challeng.challenge,
          ))
        }


      });
      setState(() {
        
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: this.challengWidget,
              
              /*ProfileTrophyEntry(
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
                    ),*/
            
          ),
        ],
      ),
    );
  }
}
