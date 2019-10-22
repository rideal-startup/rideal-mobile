import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rideal/services/i18n.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

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
