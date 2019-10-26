import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Line {
  final String name;
  final Color color;
  final IconData icon;

  Line({this.name, 
        this.color = Colors.pink, 
        this.icon = Icons.subway});
}