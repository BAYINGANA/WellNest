import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Thinking...',
            style: TextStyle(
              color: Colors.grey[600],
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
