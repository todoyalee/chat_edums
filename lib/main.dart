import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(), // Set the ChatScreen as the home
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // List to hold messages
  bool isTalker1 = true; // Toggle between talker1 and talker2

  // Function to add a new message
  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'isTalker1': isTalker1,
        });
        isTalker1 = !isTalker1; // Switch between talker1 and talker2
        _messageController.clear(); // Clear the text field
      });
    }
  }

  // Show predefined messages
  void _showPredefinedMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow full height for the bottom sheet
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 500, // Adjust height as needed
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text("Messages Predefined",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Opacity(
                          opacity: 0.7,
                          child: Text("choose the message to send",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Expanded(
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _sendMessage("Hello! How are you?");
                          Navigator.of(context).pop(); // Close bottom sheet
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(17.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text("Hello! How are you?"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _sendMessage("so great thank you ");
                                Navigator.of(context)
                                    .pop(); // Close bottom sheet
                              },
                              child: Container(
                                padding: EdgeInsets.all(17.0),
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text("so great thank you "),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _sendMessage("Hello! How are you?");
                          Navigator.of(context).pop(); // Close bottom sheet
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(17.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text("Hello! How are you??"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _sendMessage("how was your day ");
                                Navigator.of(context)
                                    .pop(); // Close bottom sheet
                              },
                              child: Container(
                                padding: EdgeInsets.all(17.0),
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text("Hello! How are you?"),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _sendMessage(" Hello! How are you?");
                          Navigator.of(context).pop(); // Close bottom sheet
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(17.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text("Hello! How are you?"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _sendMessage("Hello! How are you?");
                                Navigator.of(context)
                                    .pop(); // Close bottom sheet
                              },
                              child: Container(
                                padding: EdgeInsets.all(17.0),
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text("Hello! How are you?"),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _sendMessage("Hello! How are you?");
                          Navigator.of(context).pop(); // Close bottom sheet
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(17.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text("Hello! How are you?"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _sendMessage("Hello! How are you?");
                                Navigator.of(context)
                                    .pop(); // Close bottom sheet
                              },
                              child: Container(
                                padding: EdgeInsets.all(17.0),
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text("no problem! "),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Show file options
  void _showFileOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          //  padding: EdgeInsets.all(16.0),
          height: 300, // Adjust height as needed
          decoration: BoxDecoration(
            //color: Colors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Row(children: [
                    Icon(
                      Icons.attach_file,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text("Insert File",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Opacity(
                          opacity: 0.7,
                          child: Text("choose your file from",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  ])),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Camera"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add document action
                        Navigator.of(context).pop(); // Close bottom sheet
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Icon(
                                Icons.insert_drive_file,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(height: 5), // Space between icon and text
                          Text("Document"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text("Chatter's Name"),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Notification action
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Expanded to make it scrollable
          Expanded(
            child: ListView.builder(
              reverse: true, // This keeps the latest message at the bottom
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - index - 1];
                final isTalker1 = message['isTalker1'];

                return Align(
                  alignment:
                      isTalker1 ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: isTalker1 ? Colors.blue[100] : Colors.green[100],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          // Bottom Bar
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed:
                      _showPredefinedMessages, // Show predefined messages
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: _showFileOptions, // Show file options
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
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    // Voice message action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
