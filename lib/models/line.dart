import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/utils.dart';

import 'city.dart';

class Line {
  final String id;
  final String name;
  final Color color;
  final int length;
  final String transportationMode;
  final String routeType;
  final List<Stop> stops;
  final bool available;
  final bool onFreeDays;
  final City city;

  Line({this.id,
        this.name, 
        this.color = Colors.pink, 
        this.length = 0,
        this.transportationMode = 'BUS',
        this.routeType,
        this.available = true,
        this.onFreeDays = true,
        this.city,
        this.stops = const []});

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      color: HexColor.fromHex(json['color']),
      name: json['name'],
      id: json['id'],
      stops: json['stops'].map((o) { return Stop.fromJson(o); }),
      city: City.fromJson(json['city']),
      available: json['available'],
      onFreeDays: json['onFreeDays'],
      routeType: json['routeType'],
      length: json['length'],
      transportationMode: json['transportationMode']
    );
  }

  get icon {
    if (transportationMode == 'METRO')
      return Icons.subway;
    
    if (transportationMode == 'TRAIN')
      return FontAwesomeIcons.train;
    
    if (transportationMode == 'BUS')
      return FontAwesomeIcons.bus;
  }
}