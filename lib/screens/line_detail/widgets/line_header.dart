import 'package:flutter/material.dart';
import 'package:rideal/models/line.dart';



class LineHeader extends StatelessWidget {
  final Line line;
  const LineHeader({Key key, this.line}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Container(
          height: 90,
          child: Card(
            color: Colors.indigoAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          this.line?.city?.name,//'Barcelona',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          this.line?.name,//'La Rambla',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.indigo,
                      child: Text(
                         this.line?.name?.substring(0, 2),// TODO: FIND LINE NUMBER'L2',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
