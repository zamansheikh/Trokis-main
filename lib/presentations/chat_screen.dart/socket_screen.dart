import 'package:flutter/material.dart';
import 'conversation_list_page.dart';

// import 'package:agora_uikit/agora_uikit.dart';

// final AgoraClient client = AgoraClient(
//   agoraConnectionData: AgoraConnectionData(
//     appId: "e7f6e9aeecf14b2ba10e3f40be9f56e7",
//     channelName: "test",
//     tempToken: token,
//   ),
//   enabledPermission: [
//     Permission.camera,
//     Permission.microphone,
//   ],
// );

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enhanced Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConversationListPage(),
      ),
    );
  }
}
