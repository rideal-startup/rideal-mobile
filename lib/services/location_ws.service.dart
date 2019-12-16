import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rideal/models/location_message.dart';

class RealTimeLocation {
  final db  = Firestore.instance;

  StreamSubscription subscribeToLine({String lineId, Function onMessage}) {
    return this.db
      .collection('lines-location')
      .document(lineId)
      .snapshots()
      .listen((msg) {
        if (msg.data != null) {
          final data = LocationMessage.fromJson(msg.data);
          onMessage(data);
        }
      }
    );
  }
}

