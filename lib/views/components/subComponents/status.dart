import 'package:flutter/material.dart';

class statut extends StatelessWidget {
  final String statutt;
  const statut({super.key, required this.statutt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,
        width: 80,
        child: Text(
          statutt,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: Colors.red.withOpacity(0.4)),
      ),
    );
  }
}
