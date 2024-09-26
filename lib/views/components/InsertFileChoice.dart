import 'package:flutter/material.dart';

class Insertfilechoice extends StatelessWidget {
  final Color color;
  final String text;
  final Icon icon;
  const Insertfilechoice(
      {super.key, required this.color, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundColor: color,
            child: icon,
          ),
        ),
        SizedBox(height: 5),
        Text(text),
      ],
    );
  }
}
