import 'package:flutter/material.dart';
import 'package:rideal/widgets/FeedEntry.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreen createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
            Row(children: <Widget>[FeedEntry(userName: "Apetusio Disousa", date: "10/10/1994", bodyText: "Has won a prize del copon!",),]),
          ],
        )
      ),
    );
  }
}