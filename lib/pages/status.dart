import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _socketService = new SocketService();
    return Scaffold(
      body: Center(
        child: Text('Hola Status Page'),
      ),
    );
  }
}
