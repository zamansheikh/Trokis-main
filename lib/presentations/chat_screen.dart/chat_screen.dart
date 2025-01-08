import 'package:flutter/material.dart';
import 'package:trokis/presentations/chat_screen.dart/chat_bubble.dart';
import 'package:trokis/presentations/chat_screen.dart/socket_secret/socket_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late SocketService _socketService;
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;

  bool isScrolledToBottom() {
    if (_scrollController.hasClients) {
      return _scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _socketService = SocketService();
    _socketService.connect();

    // Add scroll listener
    _scrollController.addListener(() {
      if (isScrolledToBottom() && !_hasScrolledToBottom) {
        _hasScrolledToBottom = true;
        _socketService.sendSeenMessage("Seen");
      } else if (!isScrolledToBottom()) {
        _hasScrolledToBottom = false;
      }
    });

    _socketService.onSeenMessage((message) {
      debugPrint('Message seen: $message');
      print((message == "Seen"));

      if (message == "Seen") {
        setState(() {
          for (var element in _messages) {
            element['seenByMe'] = true;
          }
        });
      }
    });

    _socketService.onChatMessage((message) {
      debugPrint('Message received: $message');
      setState(() {
        _messages.add({
          'message': message,
          'isMyMessage': false,
          'seenByMe': isScrolledToBottom(),
        });
      });

      // Only send seen message if already at bottom
      if (isScrolledToBottom()) {
        _socketService.sendSeenMessage("Seen");
      }

      print("isScrolledToBottom: ${isScrolledToBottom()}");

      // Auto-scroll to bottom if already at bottom
      if (_hasScrolledToBottom) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'message': message,
          'isMyMessage': true,
          'seenByMe': false, // Placeholder for seen status
        });
      });
      _messageController.clear();
      // Simulate receiving a message
      // Future.delayed(const Duration(seconds: 1), () {
      //   setState(() {
      //     _messages.add({
      //       'message': 'This is a reply to "$message".',
      //       'isMyMessage': false,
      //       'seenByMe': false,
      //     });
      //   });
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced Chat'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final messageData = _messages[index];
                  return ChatBubble(
                    message: messageData['message'],
                    isMyMessage: messageData['isMyMessage'],
                    seenByMe: messageData['seenByMe'],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
