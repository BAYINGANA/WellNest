import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  final List<Map<String, String>> contacts = const [
    {
      "name": "Campus Security",
      "phone": "+1234567890",
    },
    {
      "name": "Health Services",
      "phone": "+0987654321",
    },
    {
      "name": "Counseling Center",
      "phone": "+1122334455",
    },
    {
      "name": "Local Police",
      "phone": "911",
    },
    {
      "name": "Fire Department",
      "phone": "101",
    },
  ];

  void _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Contacts"),
        backgroundColor: const Color(0xFFA1EEBD),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                contacts[index]["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(contacts[index]["phone"]!),
              trailing: IconButton(
                icon: const Icon(Icons.phone, color: Colors.green),
                onPressed: () => _makePhoneCall(contacts[index]["phone"]!),
              ),
            ),
          );
        },
      ),
    );
  }
}
