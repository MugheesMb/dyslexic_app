import 'package:flutter/material.dart';

class SignleMesage extends StatelessWidget {
  final String message;
  final bool isMe;
  const SignleMesage({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
              color: isMe ? Colors.black : Colors.orange,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
