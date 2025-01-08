import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trokis/presentations/chat_screen.dart/api_contrains.dart';
import 'package:trokis/presentations/chat_screen.dart/conversation_details_page.dart';
import 'package:trokis/presentations/chat_screen.dart/models/conversation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConversationListPage extends StatefulWidget {
  const ConversationListPage({
    super.key,
  });

  @override
  State<ConversationListPage> createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage> {
  List<Conversation> allConversations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchConversations();
  }

  Future<void> fetchConversations() async {
    final String token = ApiContrainsChat.token;
    const String baseUrl = "http://vibely-ifti.sarv.live";
    const String endpoint = '/conversation/find?term=&limit=10&page=1';
    final String url = '$baseUrl$endpoint';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> conversationsJson = data['data'];
        setState(() {
          allConversations = conversationsJson
              .map((json) => Conversation.fromJson(json))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load conversations');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching conversations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text("Conversations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allConversations.length,
        itemBuilder: (context, index) {
          final conversation = allConversations[index];
          final formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
              .format(DateTime.parse(conversation.lastMessageCreatedAt));

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                '${ApiContrainsChat.baseUrl}/${conversation.profilePicture}',
              ),
            ),
            title: Text(
              conversation.participantName[0].toUpperCase() +
                  conversation.participantName.substring(1),
            ),
            subtitle: conversation.messageType == "text"
                ? Text(conversation.lastMessage ?? "")
                : Text(
                    "${conversation.participantName[0].toUpperCase() + conversation.participantName.substring(1)} sent an image"),
            trailing: Text(
              formattedDate,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () async {
              // Navigate to conversation detail page
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ConversationDetailPage(conversation: conversation),
                ),
              ).then((value) {
                if (true) {
                  fetchConversations();
                }
              });
            },
          );
        },
      ),
    );
  }
}
