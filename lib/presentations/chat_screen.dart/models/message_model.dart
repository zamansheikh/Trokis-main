class MessageFile {
  final String url;
  final String type;

  MessageFile({
    required this.url,
    required this.type,
  });

  factory MessageFile.fromJson(Map<String, dynamic> json) {
    return MessageFile(
      url: json['url'],
      type: json['type'],
    );
  }
}

class Message {
  final String id;
  final String senderId;
  final String? content;
  final String conversationId;
  final List<MessageFile> files;
  final String messageType;
  final List<String> seenBy;
  final DateTime createdAt;
  final String profilePicture;
  final double? latitude;
  final double? longitude;

  Message({
    required this.id,
    required this.senderId,
    this.content,
    required this.conversationId,
    required this.files,
    required this.messageType,
    required this.seenBy,
    required this.createdAt,
    required this.profilePicture,
    this.latitude,
    this.longitude,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    final files = (json['file'] as List<dynamic>)
        .map((file) => MessageFile.fromJson(file))
        .toList();

    return Message(
      id: json['_id'],
      senderId: json['senderID'],
      content: json['content'] ?? '',
      conversationId: json['conversationID'],
      files: files,
      messageType: json['messageType'],
      seenBy: List<String>.from(json['seenBy']),
      createdAt: DateTime.parse(json['createdAt']),
      profilePicture: json['profilePicture'] ?? '',
      latitude: json['location'] != null ? json['location']['latitude'] : null,
      longitude:
          json['location'] != null ? json['location']['longitude'] : null,
    );
  }
}
