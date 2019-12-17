import 'package:flutter/material.dart';
import 'package:rideal/models/feed.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/feed/widgets/feed_entry.dart';
import 'package:rideal/services/feed.service.dart';
import 'package:rideal/services/sign_in_up.service.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreen createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  final authService = SignInUpService();
  final feedService = FeedService();
  List<Feed> listFeed = [];
  User user;
  
  @override
  void initState() {
    this.getCurrentUser();
    super.initState();
  }

  Future<void> getCurrentUser() async{
    User user = await this.authService.currentUser;
    this.user = user;

    List<Feed> feedList = await this.feedService.getUserFeed(this.user.id);    
    this.listFeed = feedList;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: listFeed
                    .map<Widget>((feed) => FeedEntry(
                        userName: feed.username,
                        title: feed.title,
                        bodyText: feed.description))
                    .toList(),
              ),
            ),]
          ),);
  }
}
