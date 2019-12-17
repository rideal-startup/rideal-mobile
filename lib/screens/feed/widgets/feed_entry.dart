import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/widgets/circle_image.dart';

class FeedEntry extends StatefulWidget {
  final String _userName;
  final String _title;
  final String _bodyText;
  final String _profileImageUrl;
  const FeedEntry({Key key, userName, title, bodyText, profileImageUrl})
      : this._userName = userName, this._title = title, this._bodyText = bodyText, this._profileImageUrl = profileImageUrl, super(key: key);

  @override
  _FeedEntryState createState() => _FeedEntryState();
}

class _FeedEntryState extends State<FeedEntry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: new TopEntry(
            userName: this.widget._userName,
            title: this.widget._title,
            profileUrl: this.widget._profileImageUrl
            ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
          child: new BodyEntry(bodyText: this.widget._bodyText),
        )
      ],
    );
  }
}

class BodyEntry extends StatefulWidget {
  final String _bodyText;

  const BodyEntry({Key key, bodyText, title}) : 
    this._bodyText = bodyText, super(key: key);

  @override
  _BodyEntryState createState() => _BodyEntryState();
}

class _BodyEntryState extends State<BodyEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
        width: 250,
        height: 80,
        child: Card(
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.award,
                size: 50,
              ),
              Expanded(
                child: Text(this.widget._bodyText),
              ),
              Text("  "),
            ],
          ),
        ),
      ),
    ]);
  }
}

class TopEntry extends StatefulWidget {
  final String _userName;
  final String _title;
  final String _profileUrl;

  const TopEntry({
    Key key,
    userName,
    profileUrl,
    title,
  }) : this._userName = userName, this._title = title, this._profileUrl=profileUrl, super(key: key);

  @override
  _TopEntryState createState() => _TopEntryState();
}

class _TopEntryState extends State<TopEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleImage(
                this.widget._profileUrl, 
                isUrl: true,
                size: 100,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(this.widget._userName),
                ),],
            ),
            Row(
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(this.widget._title),
                ),],
            ),
          ],
        ),
      ],
    );
  }
}
