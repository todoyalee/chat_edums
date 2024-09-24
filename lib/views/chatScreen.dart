import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; // For formatting the date

class ChatScreen extends StatefulWidget {
  final String headerText;
  ChatScreen({required this.headerText});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool isTalker1 = true;
  int? _editingMessageIndex;
  double _paddingValue = 10.0;

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'isTalker1': isTalker1,
          'time': DateTime.now(),
        });
        isTalker1 = !isTalker1;
        _messageController.clear();
        _paddingValue = 10.0;
      });
    }
  }

  void _onTextChanged(String text) {
    setState(() {
      _paddingValue = 10.0 + (text.length > 0 ? text.length * 2 : 0);
    });
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('hh:mm a, MMM d').format(dateTime);
  }

  void _showPredefinedMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 500,
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.message_outlined, color: Colors.white),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Messages Predefined",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Opacity(
                          opacity: 0.7,
                          child: Text("Choose the message to send",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _messageController.text = "Hello! How are you?";
                        Navigator.of(context).pop();
                      },
                      child: Row(children: [
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
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            _messageController.text = "Hello! How are you?";
                            Navigator.of(context).pop();
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
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        _messageController.text = "So great, thank you!";
                        Navigator.of(context).pop();
                      },
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.all(17.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text("So great, thank you!"),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            _messageController.text = "So great, thank you!";
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(17.0),
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text("So great, thank you!"),
                          ),
                        )
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        _messageController.text = "How was your day?";
                        Navigator.of(context).pop();
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
                            child: Text("How was your day?"),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              _messageController.text = "How was your day?";
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(17.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text("How was your day?"),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _messageController.text = "No problem!";
                        Navigator.of(context).pop();
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
                            child: Text("No problem!"),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                              onTap: () {
                                _messageController.text = "No problem!";
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
                                child: Text("No problem!"),
                              )),
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

  void _showFileOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
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
                        Navigator.of(context).pop();
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
                          SizedBox(height: 5),
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
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              widget.headerText,
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Image(
          image: AssetImage(
            "assets/back.jpg",
          ),
          fit: BoxFit.cover,
        )),
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(16.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - index - 1];
                  final isTalker1 = message['isTalker1'];
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
                            message['text'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
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
              //change this daly to update the textfield wa9t click
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 35,
                    ),
                    onPressed: _showPredefinedMessages,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.blue,
                      size: 35,
                    ),
                    onPressed: _showFileOptions,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: _paddingValue),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.lightBlue)),
                          hintText: _editingMessageIndex == null
                              ? "Type a message"
                              : "Edit your message", //
                        ),
                        onSubmitted: (value) {
                          _sendMessage(value);
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue)),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () => _sendMessage(_messageController.text),
                    ),
                  ),
                  Container(
                    //backgroundColor: Colors.white,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue)),

                    child: IconButton(
                      icon: Icon(
                        Icons.mic,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
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
