import 'package:flutter/material.dart';

class Avatar2 extends StatelessWidget {
  final String? avatarUrl;
  final double radius;

  const Avatar2({required this.avatarUrl, required this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: avatarUrl == null
            ? CircleAvatar(
                radius: radius,
                backgroundImage: const AssetImage('pic/u.png'),
              )
            : CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(avatarUrl!),
              ),
      ),
    );
  }
}
