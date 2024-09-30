import 'package:flutter/material.dart';

class Priority extends StatelessWidget {
  final String priorite;

  const Priority({super.key, required this.priorite});

  @override
  Widget build(BuildContext context) {
    // Determine the background color based on the text
    Color backgroundColor;
    if (priorite.toLowerCase() == 'high') {
      backgroundColor = Colors.red; // Color for "High"
    } else {
      backgroundColor = Colors.green; // Color for "Normal"
    }

    return Scaffold(
      body: Center(
        // Center the CircleAvatar in the body
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            priorite,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
