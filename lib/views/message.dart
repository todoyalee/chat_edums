import 'package:flutter/material.dart';

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 20,
                ),
                Text("Messages"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.notification_add)
              ],
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),

          
        ],
      )),
    ));
  }
}
