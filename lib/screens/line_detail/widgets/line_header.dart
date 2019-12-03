import 'package:flutter/material.dart';

class LineHeader extends StatelessWidget {
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
                          'Barcelona',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          'La Rambla',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.indigo,
                      child: Text(
                        'L3',
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
