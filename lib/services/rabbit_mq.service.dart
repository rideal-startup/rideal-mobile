import 'dart:convert';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:rideal/models/location_message.dart';

class RabbitService {
  Client _client;

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
}
