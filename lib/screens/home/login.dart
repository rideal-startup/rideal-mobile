import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rideal/services/i18n.dart';

import '../../main.dart';
import '../../utils.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    PermissionHandler().requestPermissions([
      PermissionGroup.location,
      PermissionGroup.locationAlways,
      PermissionGroup.locationWhenInUse
    ]).then((val) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          FadingRoute(builder: (context) => MyHomePage()),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[850],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitRotatingPlain(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  I18n.of(context).translate("loading"),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
