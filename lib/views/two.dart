import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/stand.jpg"),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Go to Messagerie",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to login screen
              Get.toNamed('/message');
            },
            child: Text('MESSANGER'),
          ),
        ],
      ),
    );
  }
}
