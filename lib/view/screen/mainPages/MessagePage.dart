import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../data/model/message_model.dart';
import 'message.dart';


class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Messagee> messages = [];
  TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _sendMessage(String content, String type) {
    setState(() {
      messages.add(Messagee(content: content, timestamp: DateTime.now(), type: type));
    });
    _controller.clear();
  }

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendMessage(pickedFile.path, "image");
    }
  }

  void _pickAudio() async {
    // Logic to pick audio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: message.type == "text"
                      ? Text(message.content)
                      : message.type == "image"
                      ? Image.file(File(message.content))
                      : Text("Audio message"),
                  subtitle: Text(message.timestamp.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/mic.png',
                    width: 24, // Adjust size as needed
                    height: 24,
                  ),
                  onPressed: _pickAudio, // Your onPressed callback function
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text, "text");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
