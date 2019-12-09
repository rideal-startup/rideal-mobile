import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  double offset = 180;
  bool _showSuggestion = false;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _controller.reset();
        _controller.forward();
        _showSuggestion = true;
      });
    });
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    animation = Tween<double>(begin: offset, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {
          offset = animation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    /*return Positioned(
        top: 200,
        right: -offset,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            color: Colors.black54,
          ),
          height: 100,
          width: 175.0,
          // duration: Duration(seconds: 1),
          // curve: Curves.fastOutSlowIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: _line(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This line is probably faster',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        ));*/
  }

  Widget _line() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.black38,
          ),
          child: Text(
            'Linia 6',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        RaisedButton(
            color: Colors.green,
            shape: CircleBorder(),
            onPressed: () {},
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  FontAwesomeIcons.subway,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
