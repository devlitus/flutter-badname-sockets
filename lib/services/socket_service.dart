import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _shocket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _shocket;
  Function get emit => _shocket.emit;

  SocketService() {
    this._initConfig();
  }

  // Dart client
  void _initConfig() {
    _shocket = IO.io(
        'http://192.168.1.129:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableReconnection()
            .build());

    _shocket.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _shocket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      print('desconectado');
      notifyListeners();
    });
  }
}
