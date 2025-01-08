import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:trokis/presentations/chat_screen.dart/api_contrains.dart';

class SocketService {
  late IO.Socket _socket;
  final String _serverUrl = ApiContrainsChat.baseUrl;
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImlmdGVraGFyc2FsbWluQGdtYWlsLmNvbSIsImlkIjoiNjc1OTUyNDQ4Y2M3MmRlOTZiZWE0NDI0Iiwicm9sZSI6InVzZXIiLCJwcm9maWxlSUQiOiI2NzU5NTI0NjhjYzcyZGU5NmJlYTQ0MjYiLCJuYW1lIjoiSWZ0ZWtoYXJzIiwiaWF0IjoxNzM2MTU4NTg1LCJleHAiOjE3Mzg3NTA1ODV9.z8AayE9jPIPj7TwAsLqasQSjBCIdRTYcCoQACkK8HJ8";

  void connect() {
    final options = IO.OptionBuilder()
        .setTransports(['websocket']) // optional, set transports if needed
        .setExtraHeaders(
            {'authorization': "Bearer $_token"}) // set authorization header
        .build();

    // ignore: avoid_print
    print('\n\n\n\n\n\n\n\n====== Connecting to server-> $_serverUrl');

    try {
      _socket = IO.io(_serverUrl, options);

      _socket.onConnect((_) {
        // ignore: avoid_print
        print('\n\n\n\n\n\n\n\n======Connected to server');
      });

      _socket.onConnectError((err) {
        // ignore: avoid_print
        print('Connection Error: $err');
      });
      _socket.onError((err) {
        // ignore: avoid_print
        print('Error: $err');
      });
      _socket.onDisconnect((_) {
        // ignore: avoid_print
        print('Disconnected');
      });
    } catch (e) {
      // ignore: avoid_print
      print("Socket init error: $e");
    }
  }

  void sendMessage(
      {required String message,
      required String conversationID,
      required String receiverID}) {
    final messagePayload = {
      "conversationID": conversationID,
      "receiverID": receiverID,
      "content": message,
    };
    _socket.emit('send-message', messagePayload);
  }

  void onChatMessage(Function(String) callback) {
    _socket.on('send-message', (data) => callback(data));
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
