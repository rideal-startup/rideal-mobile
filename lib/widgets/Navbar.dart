import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatefulWidget {
  final Function callback;

  Navbar({Key key, this.callback}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    
    return CurvedNavigationBar(
        color: Colors.grey[900],
        index: 1,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.supervised_user_circle,size: 30,color: Colors.pink[200]),
          Icon(Icons.pin_drop, size: 30, color: Colors.pink[200]),
          Icon(FontAwesomeIcons.award, size: 30, color: Colors.pink[200]),
        ],
        onTap: this.widget.callback,
      );
  }
}