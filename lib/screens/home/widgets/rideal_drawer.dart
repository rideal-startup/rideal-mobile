import 'package:flutter/material.dart';

class RidealDrawer extends StatelessWidget {
  final Function onProfileNavigation;

  const RidealDrawer({Key key, this.onProfileNavigation}) : super(key: key);
  
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
              child: Column(children: <Widget>[
                IconButton(
                  iconSize: 100,
                  splashColor: Colors.grey,
                  icon: Icon(Icons.people),
                  onPressed: onProfileNavigation,
                ),
                Text('Profile')
              ]),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Configuraci�n y privacidad'),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Centro de Ayuda'),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}