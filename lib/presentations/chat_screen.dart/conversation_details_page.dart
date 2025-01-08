import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trokis/presentations/chat_screen.dart/api_contrains.dart';
import 'package:trokis/presentations/chat_screen.dart/chat_bubble.dart';
import 'package:trokis/presentations/chat_screen.dart/models/conversation.dart';
import 'package:trokis/presentations/chat_screen.dart/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:trokis/presentations/chat_screen.dart/socket_secret/socket_services.dart';

class ConversationDetailPage extends StatefulWidget {
  final Conversation conversation;

  const ConversationDetailPage({super.key, required this.conversation});

  @override
  State<ConversationDetailPage> createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> {
  final _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late SocketService _socketService;
  List<Message> messages = [];
  bool isLoading = true;
  int currentPage = 1;
  int totalPages = 1;

  Future<void> fetchMessages(int page, int limit) async {
    const String baseUrl = ApiContrainsChat.baseUrl;
    String conversationId = widget.conversation.id;
    final String endpoint = '/message/$conversationId?page=$page&limit=$limit';
    final String url = '$baseUrl$endpoint';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${ApiContrainsChat.token}',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> messagesJson = data['data']['messages'];

        setState(() {
          // Prepend new messages to the list
          messages.insertAll(
            0,
            messagesJson.map((json) => Message.fromJson(json)).toList(),
          );
          currentPage = data['pagination']['currentPage'];
          totalPages = data['pagination']['totalPages'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: avoid_print
      print('Error fetching messages: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _socketService = SocketService();
    _socketService.connect();

    // Add scroll listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Trigger fetching messages when scrolled to the top
        if (currentPage < totalPages) {
          fetchMessages(currentPage + 1, 5);
        }
      }
    });

    // Initial fetch
    fetchMessages(currentPage, 5);
    _socketService.onChatMessage((rcvdMessage) {
      debugPrint('Message received: $rcvdMessage');
      final message = Message(
        id: '1',
        senderId: ApiContrainsChat.currentUserId,
        content: rcvdMessage,
        conversationId: widget.conversation.id,
        files: [],
        messageType: 'text',
        seenBy: [],
        createdAt: DateTime.now(),
        profilePicture: '',
      );
      messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text('Messages'),
        ),
        body: Column(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () async {
                        if (currentPage < totalPages) {
                          await fetchMessages(currentPage + 1, 5);
                        }
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return ChatBubble(
                            message: message.messageType == 'image'
                                ? '${ApiContrainsChat.baseUrl}/${message.files.first.url}'
                                : message.content ?? '',
                            isMyMessage: message.senderId !=
                                widget.conversation.receiverID,
                            seenByMe: false,
                            isImage: message.messageType == 'image',
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
        ));
  }

  void _sendMessage() {
    final message = Message(
      id: '1',
      senderId: ApiContrainsChat.currentUserId,
      content: _messageController.text.trim(),
      conversationId: widget.conversation.id,
      files: [],
      messageType: 'text',
      seenBy: [],
      createdAt: DateTime.now(),
      profilePicture: '',
    );

    if (message.content?.isNotEmpty ?? false) {
      setState(() {
        messages.insert(0, message);
      });
      _socketService.sendMessage(
        message: message.content!,
        conversationID: widget.conversation.id,
        receiverID: widget.conversation.receiverID,
      );
      _messageController.clear();
    }
  }
}
