
import 'package:flutter/material.dart';

class ProfileFriendEntry extends StatelessWidget {
  final String _name;
  final String _user_id;
  final IconData _icon;
  final String _state;//Pending, Friend, WaitingResponce

  const ProfileFriendEntry({Key key, icon, name, user_id, state}) : this._icon = icon, this._name = name, this._user_id = user_id,this._state=state, super(key: key);

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
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Icon(this._icon, size: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(this._name),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("#"+this._user_id),
                  ),
                  Expanded(child: SizedBox()),
                  if(_state=="Friend")
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 7, 5),
                      child: Icon(Icons.delete, size: 30),
                    ),
                  if(_state=="WaitingResponce")
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 7, 5),
                      child: Icon(Icons.av_timer, size: 30),
                    ),
                  if(_state=="Pending")
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      child: Icon(Icons.person_add, size: 30),
                    ),
              
                ],
              ),
            ),
          ),
    );
  }
}