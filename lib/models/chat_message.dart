import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String text;
  final String sender;
  final Timestamp timestamp;

  ChatMessage({
    required this.text,
    required this.sender,
    required this.timestamp,
  });
  factory ChatMessage.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ChatMessage(
      text: data['text'] ?? '',
      sender: data['sender'] ?? 'unknown',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }
}
