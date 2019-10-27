import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/widgets/navbar/curved_navigation_bar.dart';

class BottomNavbar extends StatefulWidget {
  final int index;
  final Function callback;

  BottomNavbar({this.index, this.callback});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width +
          (MediaQuery.of(context).size.width / 4),
      child: CurvedNavigationBar(
        color: Colors.grey[900],
        index: this.widget.index,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.supervised_user_circle, size: 30, color: Colors.pink[200]),
          Icon(Icons.pin_drop, size: 30, color: Colors.pink[200]),
          Icon(FontAwesomeIcons.award, size: 30, color: Colors.pink[200]),
          Icon(Icons.monetization_on, size: 30, color: Colors.red[200]),
        ],
        onTap: this.widget.callback
      ),
    );
  }
}
