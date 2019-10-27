
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileTrophyEntry extends StatelessWidget {
  final String _name;
  final String _trophyId;
  final double _progress;
  final String _state;//InProgres, Complete 

  const ProfileTrophyEntry({Key key, trophy_id, name, progress, state}) : this._trophyId = trophy_id, this._name = name, this._progress = progress,this._state=state, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
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
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Icons.train, size: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(this._name),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("#"+this._trophyId),
                  ),
                  Expanded(child: SizedBox()),
                  if(_state=="Complete")
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Text("Complete"),
                    ),
                  if(_state=="Complete")
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child:
                      Icon(Icons.assignment_turned_in, size: 30),
                    ),
                  if(_state=="InProgress")
                    Padding(padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                    child: LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: this._progress,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),)
                
                ],
              ),
            ),
          ),
    );
  }
}