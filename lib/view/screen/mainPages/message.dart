class Messagee {
  final String content;
  final DateTime timestamp;
  final String type; // "text", "audio", "image"

  Messagee({required this.content, required this.timestamp, required this.type});
}
