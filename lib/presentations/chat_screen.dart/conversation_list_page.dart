import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trokis/presentations/chat_screen.dart/api_contrains.dart';
import 'package:trokis/presentations/chat_screen.dart/chat_bubble.dart';
import 'package:trokis/presentations/chat_screen.dart/models/conversation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trokis/presentations/chat_screen.dart/models/message_model.dart';

class ConversationListPage extends StatelessWidget {
  final List<Conversation> conversations;

  const ConversationListPage({super.key, required this.conversations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          final formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
              .format(DateTime.parse(conversation.lastMessageCreatedAt));

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                '${ApiContrainsChat.baseUrl}/${conversation.profilePicture}',
              ),
            ),
            title: Text(conversation.participantName),
            subtitle: conversation.messageType == "text"
                ? Text(conversation.lastMessage ?? "")
                : const Text("[Image]"),
            trailing: Text(
              formattedDate,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // Navigate to conversation detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ConversationDetailPage(conversation: conversation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class ConversationDetailPage extends StatefulWidget {
//   final Conversation conversation;

//   const ConversationDetailPage({super.key, required this.conversation});

//   @override
//   State<ConversationDetailPage> createState() => _ConversationDetailPageState();
// }

// class _ConversationDetailPageState extends State<ConversationDetailPage> {
//   List<Message> messages = [];
//   bool isLoading = true;
//   int currentPage = 1;
//   int totalPages = 1;

//   Future<void> fetchMessages(int page, int limit) async {
//     const String baseUrl = ApiContrainsChat.baseUrl;
//     String conversationId = widget.conversation.id;
//     final String endpoint = '/message/$conversationId?page=$page&limit=$limit';
//     final String url = '$baseUrl$endpoint';

//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'Authorization': 'Bearer ${ApiContrainsChat.token}',
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final List<dynamic> messagesJson = data['data']['messages'];

//         setState(() {
//           messages.addAll(
//             messagesJson.map((json) => Message.fromJson(json)).toList(),
//           );
//           currentPage = data['pagination']['currentPage'];
//           totalPages = data['pagination']['totalPages'];
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load messages');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error fetching messages: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchMessages(currentPage, 5);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Messages'),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: messages.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == messages.length) {
//                   return currentPage < totalPages
//                       ? ElevatedButton(
//                           onPressed: () => fetchMessages(currentPage + 1, 5),
//                           child: const Text('Load More'),
//                         )
//                       : const SizedBox();
//                 }

//                 final message = messages[index];
//                 print(
//                     "Print All file URL: ${message.files.map((file) => file.url)}");
//                 return Card(
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(message.profilePicture),
//                     ),
//                     title: message.messageType == 'image'
//                         ? Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: message.files
//                                 .map((file) => Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Image.network(
//                                         '${ApiContrainsChat.baseUrl}/${file.url}',
//                                         height: 100,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ))
//                                 .toList(),
//                           )
//                         : Text('Message Content'),
//                     subtitle: Text(
//                         'Sent at: ${message.createdAt.toLocal().toString()}'),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

class ConversationDetailPage extends StatefulWidget {
  final Conversation conversation;

  const ConversationDetailPage({super.key, required this.conversation});

  @override
  State<ConversationDetailPage> createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> {
  final _messageController = TextEditingController();
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
          messages.addAll(
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
      print('Error fetching messages: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMessages(currentPage, 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              reverse: true,
              itemCount: messages.length + 1,
              itemBuilder: (context, index) {
                if (index == messages.length) {
                  return currentPage < totalPages
                      ? ElevatedButton(
                          onPressed: () => fetchMessages(currentPage + 1, 5),
                          child: const Text('Load More'),
                        )
                      : const SizedBox();
                }

                final message = messages[index];
                // Use the ChatBubble widget here
                return ChatBubble(
                  message: message.messageType == 'image'
                      ? '${ApiContrainsChat.baseUrl}/${message.files.first.url}'
                      : message.content ?? '',
                  isMyMessage:
                      message.senderId == ApiContrainsChat.currentUserId,
                  seenByMe: false,
                  isImage: message.messageType == 'image',
                );
              },
            ),
    );
  }
}
