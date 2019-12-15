import 'dart:async';
import 'dart:convert';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/location_message.dart';


class RabbitService {
  Client _client;
  Timer _timer;
  
  final Location _locationService = Location();
  static RabbitService _instance;
  
  // Singleton
  static RabbitService get instance {
    if (_instance != null) return _instance;
    
    _instance = RabbitService();
    return _instance;  
  }

  // Lazy client
  Client get client {
    if (_client != null) return _client;

    final auth =
        AmqPlainAuthenticator('prqbrgss', 'APzNxC7s3dDuc25dFKRAwkfgst7iWcbq');
    final settings = ConnectionSettings(
        host: 'duckbill.rmq.cloudamqp.com',
        virtualHost: 'prqbrgss',
        authProvider: auth,
        port: 5672);
    _client = Client(settings: settings);
    return _client;
  }

  Future<void> publish(final LocationMessage message) async {
    final jsonMsg = json.encode(message.toJson());
    final client = this.client;
    final channel = await client.channel();
    final queue = await channel.queue("hello", durable: true);
    print(" [x] Sent Message");
    queue.publish(jsonMsg);
  }

  void sendLocationEvery({final Duration duration, final String lineId}) {
    _timer = Timer.periodic(Duration(seconds: 1), (_) async {
      final pos = await _locationService.getLocation();
      publish(
        LocationMessage(
          lineId: lineId,
          location: LatLng(pos.latitude, pos.longitude)
        )
      );
    });
  }

  void stopTransmission() {
    if (_timer != null)
      this._timer.cancel();
    else
      print('[WARN] Timer was not stopped because it was null');
    this._client = null;
  }
}
