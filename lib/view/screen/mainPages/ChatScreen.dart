import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting
import 'dart:math';

class GenerativeModel {
  final String model;
  final String apiKey;

  GenerativeModel({required this.model, required this.apiKey});

  Future<Content> generateContent(List<Content> content) async {
    // Récupérer le message de l'utilisateur
    String userMessage = content.first.text;

    // Implémenter la logique de génération de contenu ici en fonction de userMessage
    String generatedResponse = await generateResponseUsingNLP(userMessage);

    // Retourner le contenu généré
    return Content(text: generatedResponse);
  }
}

Future<String> generateResponseUsingNLP(String userMessage) async {
  // Convertir le message de l'utilisateur en minuscules pour une comparaison insensible à la casse
  String lowercaseMessage = userMessage.toLowerCase();

  // Définir des mots-clés et leurs réponses associées
  Map<String, String> keywordResponses = {
    'bonjour': 'Bonjour ! Comment puis-je vous aider aujourd\'hui ?',
    'comment ça va': 'Je suis un programme informatique, donc je vais bien ! Et vous ?',
    'météo': 'La météo est ensoleillée aujourd\'hui.',
    'au revoir': 'Au revoir ! À la prochaine !',
    // Ajoutez d'autres mots-clés et leurs réponses associées selon vos besoins
  };

  // Rechercher des mots-clés dans le message de l'utilisateur et retourner une réponse appropriée
  for (var keyword in keywordResponses.keys) {
    if (lowercaseMessage.contains(keyword)) {
      // Retourner une réponse associée au mot-clé trouvé
      return keywordResponses[keyword]!;
    }
  }

  // Si aucun mot-clé n'est trouvé, retourner une réponse par défaut
  return "Désolé, je n'ai pas compris. Pouvez-vous reformuler ?";
}


class Content {
  final String text;

  Content({this.text = ''}); // Default value for text

// Additional properties and methods for Content class can be added here
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyDhnDKT5idycobku3e1ythzKh1EGM1Xsog"; // Replace with your Gemini API key
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];

  Future<void> sendMessage() async {
    final message = _userInput.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });
    final content = [Content(text: message)];
    try {
      final response = await model.generateContent(content);
      setState(() {
        _messages.add(Message(isUser: false, message: response.text, date: DateTime.now()));
      });
    } catch (e) {
      print('Error generating content: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7ECC7D),
      body: Container(
    /* decoration: BoxDecoration(

          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: const NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigDbiBM6I5Fx1Jbz-hj_mqL_KtAPlv9UsQwpthZIfFLjL-hvCmst09I-RbQsbVt5Z0QzYI_Xj1l8vkS8JrP6eUlgK89GJzbb_P-BwLhVP13PalBm8ga1hbW5pVx8bswNWCjqZj2XxTFvwQ__u4ytDKvfFi5I2W9MDtH3wFXxww19EVYkN8IzIDJLh_aw/s1920/space-soldier-ai-wallpaper-4k.webp'),
            fit: BoxFit.cover,
          )
          ,
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _userInput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: const Text('Enter Your Message'),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(12),
                    iconSize: 30,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                    ),
                    onPressed: sendMessage,
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10, color: isUser ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
