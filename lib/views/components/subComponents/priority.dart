import 'package:flutter/material.dart';

class Priority extends StatelessWidget {
  final String priorite;

  const Priority({super.key, required this.priorite});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (priorite.toLowerCase() == 'high') {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.green;
    }

    return Scaffold(
      body: Center(
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
