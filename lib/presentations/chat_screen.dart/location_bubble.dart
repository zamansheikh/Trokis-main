import 'package:flutter/material.dart';

class LocationBubble extends StatelessWidget {
  final double latitude;
  final double longitude;
  final bool isMyMessage;

  const LocationBubble({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.isMyMessage,
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
            Text(
              'Location:',
              style: TextStyle(
                color: isMyMessage ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Latitude: $latitude',
              style: TextStyle(
                color: isMyMessage ? Colors.white : Colors.black,
              ),
            ),
            Text(
              'Longitude: $longitude',
              style: TextStyle(
                color: isMyMessage ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
