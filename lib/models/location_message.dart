class LocationMessage {
  final String lineId;
  final double lat;
  final double lng;
  final int timestamp;

  LocationMessage({this.lineId, this.lat, this.lng}) : 
    this.timestamp = new DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      'lineId': this.lineId,
      'lat': this.lat,
      'lng': this.lng,
      'timestamp': this.timestamp
    };
  }
}