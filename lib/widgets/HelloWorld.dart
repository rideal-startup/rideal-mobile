import 'package:flutter/cupertino.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "HelloWorld",
            style: TextStyle(fontSize: 20),
            ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
