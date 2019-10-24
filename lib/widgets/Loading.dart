import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rideal/services/i18n.dart';

import '../utils.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  // @override
  // void initState() { 
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       FadingRoute(builder: (context) => HomePage()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SpinKitRotatingPlain(
            color: Colors.white,
          ),
          Padding(
              padding: const EdgeInsets.all(40), 
              child: Text(
                AppLocalizations.of(context).translate("loading"),
                style: TextStyle(fontSize: 20),
              ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
