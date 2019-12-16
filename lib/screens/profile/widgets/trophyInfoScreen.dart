import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/challenge.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/widgets/profile_friend_entry.dart';

class TrophyInfoScreen extends StatefulWidget {
  final Challenge challenge;

  const TrophyInfoScreen({Key key, this.challenge}) : super(key: key);
  
  @override
  _TrophyInfoScreenState createState() => _TrophyInfoScreenState();

}

class _TrophyInfoScreenState extends State<TrophyInfoScreen> {
  
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
        child: Icon(FontAwesomeIcons.award, size: 35),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(this.widget.challenge?.name),
      ),
     Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("#"+this.widget.challenge?.id),
     ),
     Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("Description: "+this.widget.challenge?.description),
     ),
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      //   child: Text("Difficulty: "+this.widget.challenge?.difficulty),
      // ),
     Padding(
       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
       child: Text("Duration: "+ res),
     ),
      ]
    ));
  }
}