import 'dart:async';

import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/location_message.dart';
import 'package:web_socket_channel/io.dart';


class RealTimeLocationWS {
  final socketUrl = Enviroment.apiBaseUrl
                      .replaceFirst('https', 'ws')
                      .replaceFirst('/api', '/socket');

  IOWebSocketChannel _channel; 
  
  IOWebSocketChannel get channel {
    if (_channel != null) return _channel;
    print('Socket ' + socketUrl);
    _channel = IOWebSocketChannel.connect(socketUrl + '/chat', headers: {
      'Upgrade': 'websocket',
      'Connection': 'upgrade',
      "Content-Length": 0
    });
    return _channel;
  }

  void subscribeToLine({String lineId, Function onRecieve}) async {
    final cChannel = this.channel;

    cChannel.stream.listen((msg) {
      final message = LocationMessage.fromJson(msg);
      if (message.lineId == lineId)
        onRecieve(message);
    });
  }
}
