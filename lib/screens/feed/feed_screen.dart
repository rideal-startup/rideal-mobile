import 'package:flutter/material.dart';
import 'package:rideal/screens/feed/widgets/feed_entry.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreen createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
          ],
        ),
      )
    );
  }
}