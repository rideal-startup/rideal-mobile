import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMessage {
  final String lineId;
  final LatLng location;
  final int timestamp;

  LocationMessage({this.lineId, this.location}) : 
    this.timestamp = new DateTime.now().millisecondsSinceEpoch;

  factory LocationMessage.fromJson(Map<String, dynamic> json) {
    return LocationMessage(
      location: LatLng(json['lat'], json['lng']),
      lineId: json['lineId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lineId': this.lineId,
      'lat': this.location.latitude,
      'lng': this.location.longitude,
      'timestamp': this.timestamp
    };
  }
}