import 'package:google_maps_flutter/google_maps_flutter.dart';

enum StopType {
  Bus,
  Train,
  Metro
}

class Stop {
  final LatLng position;
  final String name;
  final int order;

  final BitmapDescriptor bitmap;

  Stop({this.position, 
        this.order,
        this.name, 
        this.bitmap = BitmapDescriptor.defaultMarker });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      name: json['name'],
      position: LatLng(json['location']['lat'], json['location']['lng']),
      order: json['order']
    );
  }

}