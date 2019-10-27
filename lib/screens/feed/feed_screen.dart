import 'package:flutter/material.dart';
import 'package:rideal/screens/feed/widgets/feed_entry.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreen createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  var users = [
    {
      "userName": "Apetusio Disousa",
      "date": "10/10/1994",
      "bodyText": "feed-achievement-first-time"
    },
    {
      "userName": "Apetusio Disousa",
      "date": "10/10/1994",
      "bodyText": "feed-achievement-50km"
    },
    {
      "userName": "Apetusio Disousa",
      "date": "10/10/1994",
      "bodyText": "feed-achievement-100km"
    },
    {
      "userName": "Lazarito Disousa",
      "date": "10/10/1994",
      "bodyText": "feed-achievement-200km"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: users
            .map<Widget>((user) => FeedEntry(
                userName: user['userName'],
                date: user['date'],
                bodyText: user['bodyText']))
            .toList(),
      ),
    ));
  }
}
