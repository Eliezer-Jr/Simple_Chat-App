class ChatMessage {
  final String id;
  final String message;
  final String sender;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.message,
    required this.sender,
    required this.timestamp,
  });
}
