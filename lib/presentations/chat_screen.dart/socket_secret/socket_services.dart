import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trokis/presentations/chat_screen.dart/socket_secret/constant.dart';

class SocketService {
  late IO.Socket _socket;
  final String _serverUrl = SocketSecret.socketUrl;
  final String _token = SocketSecret.authToken;

  void connect() {
    final options = IO.OptionBuilder()
        .setTransports(['websocket']) // optional, set transports if needed
        .setExtraHeaders({'auth': _token}) // set authorization header
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

  void onSeenMessage(Function(String) callback) {
    _socket.on('seen message', (data) {
      return callback(data);
    });
  }

  void sendSeenMessage(String message) {
    _socket.emit('seen message', message);
  }

  void disconnect() {
    _socket.disconnect();
  }
}
