import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/utils.dart';
import 'package:rideal/widgets/circle_image.dart';

class RidealDrawer extends StatefulWidget {
  final Function onProfileNavigation;
  final Function onLogOut;

  const RidealDrawer({Key key, this.onProfileNavigation, this.onLogOut}) : super(key: key);
  
  @override
  _RidealDrawerState createState() => _RidealDrawerState();
}

class _RidealDrawerState extends State<RidealDrawer> {
  final authService = SignInUpService();

  User currentUser;

  @override
  void initState() {
    this.authService.currentUser.then((user) {
      this.currentUser = user;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onProfileNavigation();
                  },
                  child: CircleImage(currentUser?.photoLink, isUrl: true),
                ),
                Padding(padding: EdgeInsets.all(7),),
                Text(
                  '${currentUser?.name} ${currentUser?.surname}', 
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
                Text(
                  '@${currentUser?.username}', 
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                )
              ]
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidUser),
            title: Text(I18n.of(context).translate('profile')),
            onTap: () {
              Navigator.pop(context);
              widget.onProfileNavigation();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(I18n.of(context).translate('setting-privacy')),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(I18n.of(context).translate('help-centre')),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.language),
            title: Text(I18n.of(context).translate('language')),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              changeLanguage(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text(I18n.of(context).translate('sign-out')),
            onTap: () {
              widget.onLogOut();
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text(I18n.of(context).translate('close app')),
            onTap: ()=> exit(0),
          ),
        ],
      ),
    );
  }
}