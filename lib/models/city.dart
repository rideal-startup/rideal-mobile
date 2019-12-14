import 'package:google_maps_flutter/google_maps_flutter.dart';

class City {
  final String id;
  final String name;
  final String country;
  final int postalCode;
  final LatLng location;

  City({this.id, this.name, this.country, this.postalCode, this.location});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'country': this.country,
      'postalCode': this.postalCode,
      'location': {
        'lat': this.location.latitude,
        'lng': this.location.longitude
      }
    };
  }
  
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      country: json['country'],
      name: json['name'],
      id: json['id'],
      postalCode: json['postalCode'],
      location: LatLng(json['location']['lat'], json['location']['lng']),
    );
  }
}