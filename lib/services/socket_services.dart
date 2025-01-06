// import 'package:socket_io_client/socket_io_client.dart' as IO;

// void main() {
//   // Replace 'your_token' with your actual authentication token
//   final String token = 'your_token';

//   // Configure the Socket options with the authorization header
//   final options = IO.OptionBuilder()
//       .setTransports(['websocket']) // optional, set transports if needed
//       .setExtraHeaders({'Authorization': 'Bearer $token'}) // set authorization header
//       .build();

//   // Create a SocketIO instance with the options
//   final socket = IO.io('http://localhost:3000', options);

//   // Listen for connection events
//   socket.onConnect((_) {
//     print('connected');
//     socket.emit('msg', 'test message'); // emit an event after connection
//   });

//   socket.on('event', (data) => print(data)); // listen for events from server

//   socket.onDisconnect((_) => print('disconnected'));

//   // ... rest of your code
// }
