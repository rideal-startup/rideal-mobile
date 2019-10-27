import 'package:flutter/material.dart';

class LeaderboardEntry extends StatelessWidget {
  final String _index;
  final String _userName;
  final String _punctuation;

  const LeaderboardEntry({Key key, index, userName, punctuation}) : this._index = index, this._userName = userName, this._punctuation = punctuation, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width*0.95,
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(this._index.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Icon(Icons.account_circle, size: 70),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(this._userName),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(this._punctuation),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}