import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket _socket;
  final String _serverUrl = 'http://10.0.80.110:3000';
  final String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyMywidXNlcm5hbWUiOiJ0ZXN0dXNlciIsImlhdCI6MTczNjI0NjIyMiwiZXhwIjoxNzM2MjQ5ODIyfQ.mmszenMkBRS_mqDZOx9_dv_xPj45JKTq2VSnfVJZnKU';

  void connect() {
    final options = IO.OptionBuilder()
        .setTransports(['websocket']) // optional, set transports if needed
        .setExtraHeaders({'auth': 'Bearer $_token'}) // set authorization header
        .build();

    try {
      _socket = IO.io(_serverUrl, options);

      _socket.onConnect((_) {
        print('Connected to server');
      });

      _socket.onConnectError((err) => print('Connection Error: $err'));
      _socket.onError((err) => print('Error: $err'));
      _socket.onDisconnect((_) => print('Disconnected'));
    } catch (e) {
      print("Socket init error: $e");
    }
  }

  void sendMessage(String message) {
    _socket.emit('chat message', message);
  }

  void onChatMessage(Function(String) callback) {
    _socket.on('chat message', (data) => callback(data));
  }

  void disconnect() {
    _socket.disconnect();
  }
}
