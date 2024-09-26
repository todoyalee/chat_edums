import 'package:flutter/material.dart';
import 'package:chat_edums/views/chatScreen.dart';
/*

class PredefinedMessageAction extends StatefulWidget {
  final String message;
  const PredefinedMessageAction({super.key, required this.message});

  @override
  State<PredefinedMessageAction> createState() =>
      _PredefinedMessageActionState();
}

class _PredefinedMessageActionState extends State<PredefinedMessageAction> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Access the controller from the parent widget
        final state = context.findAncestorStateOfType<ChatScreenState>();
        if (state != null) {
          state.messageController.text =
              widget.message; // Use 'widget.message' to access the message
        }
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(widget.message,
            style: TextStyle(fontSize: 18)), // Display the message
      ),
    );
  }
}
*/