import 'package:flutter/material.dart';

void main() {
  runApp(Priority(text: "High"));
}

class Priority extends StatelessWidget {
  final String text;
  const Priority({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          "High",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
