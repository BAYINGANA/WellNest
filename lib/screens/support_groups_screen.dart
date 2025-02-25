import 'package:flutter/material.dart';

import 'group_chat_screen.dart';

class SupportGroupScreen extends StatelessWidget {
  final List<String> groups = [
    "General Mental Health Support",
    "Mindfulness & Meditation",
    "Youth Mental Health",
    "Postpartum Support",
    "Grief & Loss Support"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Support Groups")),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groups[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      GroupChatScreen(groupName: groups[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
