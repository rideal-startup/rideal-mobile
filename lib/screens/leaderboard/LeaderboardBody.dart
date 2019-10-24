import 'package:flutter/material.dart';

class LeaderBoardBody extends StatelessWidget {
  const LeaderBoardBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 500,
        child: ListView(
            children: <Widget>[
              Container(
                height: 90,
                color: Colors.amber[600],
                child: Row(
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text("1"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Icon(Icons.account_circle, size: 70),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Jorge Nitales"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Text("15000"),
                      ),
                  ]
                ),
              ),
            ],
          ),
        ),
      );
  }
}