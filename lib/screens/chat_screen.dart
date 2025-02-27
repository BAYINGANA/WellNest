import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../ai/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String therapistName;

  const ChatScreen({super.key, required this.therapistName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();
  final List<ChatMessage> _messages = [];
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    final connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((result) {
      setState(() => _isOnline = result != ConnectivityResult.none);
    });
  }

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final message = _controller.text.trim();
    _addMessage(message, isUser: true);

    try {
      final response = await _chatService.getResponse(message);
      _addMessage(response, isUser: false);
    } catch (e) {
      _addMessage("Let's try that again...", isUser: false);
    }
  }

  void _addMessage(String text, {required bool isUser}) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isUser: isUser,
        timestamp: DateTime.now(),
      ));
      _controller.clear();
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.therapistName,
          style: const TextStyle(
            fontFamily: 'Bitter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFF6EF4A4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          if (!_isOnline) _buildOfflineBanner(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _ChatBubble(
                message: _messages[index],
              ),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildOfflineBanner() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Color(0xFFA1EEBD),
      child: Row(
        children: [
          const Icon(Icons.wifi_off, size: 20, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            'Offline - Basic support only',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Color(0xFF010101),
              ),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: const Color(0xFF010101).withValues(alpha: 0.6),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFA1EEBD).withValues(alpha: 0.3),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _sendMessage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6EF4A4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.all(12),
            ),
            child: const Icon(Icons.send, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: message.isUser
                ? const Color(0xFFA1EEBD)
                : const Color(0xFF6EF4A4).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isUser ? Colors.black : Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
