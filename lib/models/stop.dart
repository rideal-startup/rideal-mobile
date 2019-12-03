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

  final Function onTap;
  final BitmapDescriptor bitmap;

  Stop({this.position, 
        this.order,
        this.name, 
        this.onTap, 
        this.bitmap = BitmapDescriptor.defaultMarker });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      name: json['name'],
      position: LatLng(json['location']['lat'], json['location']['lng']),
      order: json['order']
    );
  }

  Marker get marker {
    return Marker(
      position: position,
      markerId: MarkerId(position.toString()),
      infoWindow: InfoWindow(
        title: name,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () { 
        if (onTap != null)
          onTap(this); 
      },
    );
  }
}