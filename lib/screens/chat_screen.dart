// lib/screens/chat_screen.dart
import 'package:flutter/material.dart';

import '../models/chat.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> chats = [];
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchChats();
  }

  void fetchChats() async {
    var fetchedChats = await ApiService.getChats();
    setState(() {
      chats = fetchedChats;
    });
  }

  void submitChat() async {
    String username = usernameController.text;
    String message = messageController.text;
    if (username.isEmpty || message.isEmpty) return;
    Chat newChat = await ApiService.createChat(username, message);
    setState(() {
      chats.insert(0, newChat);
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username (Optional)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          CustomButton(
            text: 'Send',
            onPressed: submitChat,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return Card(
                  child: ListTile(
                    title: Text(
                        chat.username.isEmpty ? "Anonymous" : chat.username),
                    subtitle: Text(chat.message),
                    trailing: Text(chat.createdAt),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
