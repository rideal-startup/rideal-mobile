

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rideal/models/challenge.dart';
import 'package:rideal/screens/profile/widgets/profile_friends_list.dart';
import 'package:rideal/screens/profile/widgets/trophyInfoScreen.dart';
import 'package:rideal/services/i18n.dart';


class ProfileTrophyEntry extends StatelessWidget {
  final String name;
  final String trophyId;
  final double progress;
  final String state;//InProgres, Complete 
  final Challenge challenge;

  const ProfileTrophyEntry({Key key, this.name, this.trophyId, this.progress, this.state, this.challenge}) : super(key: key);

  // ProfileTrophyEntry({Key key, trophyId, name, progress, state, challenge}) : this._trophyId = trophyId, this._name = name, this._progress = progress,this._state=state,this._challenge = challenge, super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext _) => TrophyInfoScreen(
                  challenge: this.challenge,
                  state: this.state,
                )
              ));
            },
          child: Container(
        
        child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width*0.95,
                  child: Row(children: <Widget>[
                    /*TrophyPopUp(onFilterPress: () {
                      setState(() {
                        selectLine = false;
                        showFilter = !showFilter;
                      });
                    }),*/
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Icon(FontAwesomeIcons.award, size: 35),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(this.name),
                    ),
                    
                    Expanded(child: SizedBox()),
                    if(state=="Complete")
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text(I18n.of(context).translate('Complete')),
                      ),
                    if(state=="Complete")
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 7, 7),
                        child:
                        Icon(FontAwesomeIcons.checkCircle, size: 30),
                      ),
                      if(state=="New")
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text(I18n.of(context).translate('New-Challenge')),
                      ),
                    if(state=="New")
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 7, 7),
                        child:
                        Icon(FontAwesomeIcons.trophy, size: 30),
                      ),
                    if(state=="InProgress")
                      Padding(padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                      child: LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: this.progress/100?.toDouble(),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),)
                  
                  ],
                ),
              ),
            ),
      ),
    );
  }
  
  
}