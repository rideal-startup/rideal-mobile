import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/challenge.dart';
import 'package:rideal/services/challenge.service.dart';

class TrophyInfoScreen extends StatefulWidget {
  final Challenge challenge;
  final String state;

  const TrophyInfoScreen({Key key, this.challenge, this.state}) : super(key: key);
  
  @override
  _TrophyInfoScreenState createState() => _TrophyInfoScreenState();

}

class _TrophyInfoScreenState extends State<TrophyInfoScreen> {
  final ChallengeService  challengeService = ChallengeService();
  int seconds;
  int minutes;
  int hours;
  int days;
  int weeks;
  int months;
  String res = '';
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    seconds = this.widget.challenge.duration;
    minutes = (seconds / 60).toInt() % 60;
    hours = (seconds / 3600).toInt() % 24;
    days = (seconds / (86400)).toInt() % 7;
    weeks = (seconds / (6048000)).toInt() % 4;
    months = (seconds / (25920000)).toInt();

    if (months > 0) {
      res += months.toString() + ' Months ';
    }
    if (weeks > 0) {
      res += weeks.toString() + ' Weeks ';
    }
    if (days > 0) {
      res += days.toString() + ' Days ';
    }
    if (hours > 0) {
      res += hours.toString() + ' Hours ';
    }
    if (minutes > 0) {
      res += minutes.toString() + ' Minutes ';
    }
  
  }
  @override
  Widget build(BuildContext context) {
    print(this.widget.challenge?.difficulty);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(FontAwesomeIcons.trophy),
            ),
            Text("Challenge")
          ],
        ),
      ),
      body: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Icon(FontAwesomeIcons.award, size: 130),
      ),
      Padding(
       padding: const EdgeInsets.all(10),
       
     ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(this.widget.challenge?.name,
                    style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.teal,
                ),
        ),
      ),
      
     /*Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("#"+this.widget.challenge?.id),
     ),*/
     Padding(
       padding: const EdgeInsets.all(20),
       
     ),
     Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("Description: "+this.widget.challenge?.description),
     ),
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text("Prize: "+this.widget.challenge?.prize?.name),
    ),
    
     Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("Duration: "+ res),
     ),
     Spacer(),
     
     if(this.widget.state == 'New')
      Center(
        child: RaisedButton(
          
          child: Text("Enrol the challenge"),
          onPressed: () {
          this.enroleChallenge();
        },),
      ),
     if(this.widget.state == 'InProgress')
      Center(
        child: RaisedButton(
          
          child: Text("Cancell challenge"),
          onPressed: () {
          this.cancelChallenge();
        },),
      ),
     Padding(
       padding: const EdgeInsets.all(10),
       
     ),
      ]
    ));
  }

  void enroleChallenge(){
    this.challengeService.enrollChallenge(this.widget.challenge);
    Navigator.pop(context);
  }

  void cancelChallenge(){
    this.challengeService.cancelChallenge(this.widget.challenge);
    Navigator.pop(context);
  }
}