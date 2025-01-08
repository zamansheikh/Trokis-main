import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMyMessage;
  final bool seenByMe;
  final bool isImage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMyMessage,
    required this.seenByMe,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.teal[200] : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isMyMessage ? const Radius.circular(12) : Radius.zero,
            bottomRight: isMyMessage ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isImage)
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    message,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Text(
                      'Image not available',
                      style: TextStyle(color: Colors.red),
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
              )
            else
              Text(
                message,
                style: TextStyle(
                  color: isMyMessage ? Colors.white : Colors.black,
                ),
              ),
            if (isMyMessage && seenByMe)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Seen',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
