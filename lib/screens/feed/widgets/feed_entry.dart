import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class FeedEntry extends StatelessWidget {
  final String _userName;
  final String _date;
  final String _bodyText;

  const FeedEntry({Key key, userName, date, bodyText})
      : this._userName = userName, this._date = date, this._bodyText = bodyText, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 70, 0),
          child: new TopEntry(userName: this._userName, date: this._date),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
          child: new BodyEntry(bodyText: this._bodyText,),
        )
      ],
    );
  }
}

class BodyEntry extends StatelessWidget {
  final String _bodyText;
  const BodyEntry({Key key, bodyText}) : this._bodyText = bodyText, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
        width: 250,
        child: Card(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.flag,
                size: 70,
              ),
              Expanded(
                child: Text(I18n.of(context).translate(this._bodyText)),
              ),
              Text("  "),
            ],
          ),
        ),
      ),
    ]);
  }
}

class TopEntry extends StatelessWidget {
  final String _userName;
  final String _date;
  const TopEntry({
    Key key,
    userName,
    date,
  }) : this._userName = userName, this._date = date, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(this._userName),
              ],
            ),
            Row(
              children: <Widget>[
                Text(this._date),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
