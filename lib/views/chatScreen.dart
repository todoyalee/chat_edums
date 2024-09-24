import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date

class ChatScreen extends StatefulWidget {
  final String headerText;
  ChatScreen({required this.headerText});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // List to hold messages
  bool isTalker1 = true;

  // Function to add a new message with the current date and time
  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'isTalker1': isTalker1,
          'time': DateTime.now(), // Add the current date and time
        });
        isTalker1 = !isTalker1; // Switch between talker1 and talker2
        _messageController.clear(); // Clear the text field
      });
    }
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('hh:mm a, MMM d')
        .format(dateTime); // Format the date and time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(widget.headerText, style: TextStyle(color: Colors.white)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Notification action
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          "images/back.jpg",
          fit: BoxFit.cover,
        )),
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // This keeps the latest message at the bottom
                padding: EdgeInsets.all(16.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - index - 1];
                  final isTalker1 = message['isTalker1'];
                  final messageText = message['text'];
                  final messageTime = message['time'];

                  return Align(
                    alignment: isTalker1
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: isTalker1
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            color: isTalker1
                                ? Colors.blue[100]
                                : Colors.green[100],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            messageText,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        // Display the formatted date below the message
                        Text(
                          _formatDate(messageTime),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Show predefined messages
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {
                      // Show file options
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        _sendMessage(value); // Send message on Enter
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _sendMessage(
                        _messageController.text), // Send message on click
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
