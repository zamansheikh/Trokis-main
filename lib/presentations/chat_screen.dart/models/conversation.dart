class Conversation {
  final String id;
  final String participantName;
  final String receiverID;
  final String? lastMessage;
  final String messageType;
  final String lastMessageCreatedAt;
  final String profilePicture;

  Conversation({
    required this.id,
    required this.participantName,
    required this.receiverID,
    this.lastMessage,
    required this.messageType,
    required this.lastMessageCreatedAt,
    required this.profilePicture,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['_id'] as String,
      participantName: json['participantName'] as String,
      receiverID: json['receiverID'] as String,
      lastMessage: json['lastMessage'] as String?,
      messageType: json['messageType'] as String,
      lastMessageCreatedAt: json['lastMessageCreatedAt'] as String,
      profilePicture: json['profilePicture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'participantName': participantName,
      'receiverID': receiverID,
      'lastMessage': lastMessage,
      'messageType': messageType,
      'lastMessageCreatedAt': lastMessageCreatedAt,
      'profilePicture': profilePicture,
    };
  }
}
