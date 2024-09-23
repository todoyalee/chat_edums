import 'package:flutter/material.dart';

class Notificationchnge extends StatelessWidget {
  final String notificationCount;

  const Notificationchnge({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Colors.redAccent,
      child: Text(
        notificationCount,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
