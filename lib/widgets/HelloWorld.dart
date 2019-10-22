import 'package:flutter/cupertino.dart';
import 'package:rideal/services/i18n.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate("welcome", {'name':"mrcl"}),
            style: TextStyle(fontSize: 20),
            ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
