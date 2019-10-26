import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideal/models/line.dart';

enum StopType {
  Bus,
  Tram,
  Metro
}

class Stop {
  final LatLng position;
  final String name;
  final String description;
  final List<Line> lines;
  final StopType type;

  final Function onTap;
  final BitmapDescriptor bitmap;

  Stop({this.position, 
        this.name, 
        this.type = StopType.Bus,
        this.description = '', 
        this.onTap, 
        this.lines = const [],
        this.bitmap = BitmapDescriptor.defaultMarker });

  Marker get marker {
    return Marker(
      position: position,
      markerId: MarkerId(position.toString()),
      infoWindow: InfoWindow(
        title: name,
        snippet: description,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () { onTap(this); },
    );
  }
}