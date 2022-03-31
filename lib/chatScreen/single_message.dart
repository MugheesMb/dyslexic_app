import 'package:flutter/material.dart';

class SignleMesage extends StatelessWidget {
  final String message;
  final bool isMe;
  SignleMesage({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
              color: isMe ? Colors.black : Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
