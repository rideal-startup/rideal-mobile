import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rideal/models/location_message.dart';

class RealTimeLocation {
  final db  = Firestore.instance;

  void subscribeToLine({String lineId, Function onMessage}) {
    this.db
      .collection('lines-location')
      .document(lineId)
      .snapshots()
      .listen((msg) {
        final data = LocationMessage.fromJson(msg.data);
        onMessage(data);
      });
  }
}

