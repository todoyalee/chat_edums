import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:chat_edums/components/headPage.dart';
import 'package:chat_edums/components/predefinedMessage.dart';

import 'package:chat_edums/components/InsertFileChoice.dart';

import 'package:chat_edums/components/appBar.dart';

import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  //final String headerText;
  //ChatScreen({required this.headerText});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final String headerText = Get.arguments ?? 'default ';
  bool isTalker1 = true;
  int? _editingMessageIndex;
  double _paddingValue = 10.0;
  bool visibilityy1 = false;
  bool visibilityy2 = false;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
              HeadPage(
                textUp: "Messages Predefined",
                textDown: "Choose the message to send",
                image: Icon(Icons.message_outlined, color: Colors.white),
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
                        Predefinedmessage(text: "Hello! How are you?"),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            _messageController.text = "Hello! How are you?";
                            Navigator.of(context).pop();
                          },
                          child: Predefinedmessage(text: "Hello! How are you?"),
                        )
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        _messageController.text = "So great, thank you!";
                        Navigator.of(context).pop();
                      },
                      child: Row(children: [
                        Predefinedmessage(text: "So great, thank you!"),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            _messageController.text = "So great, thank you!";
                            Navigator.of(context).pop();
                          },
                          child:
                              Predefinedmessage(text: "So great, thank you!"),
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
                          Predefinedmessage(text: "How was your day?"),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              _messageController.text = "How was your day?";
                              Navigator.of(context).pop();
                            },
                            child: Predefinedmessage(text: "How was your day?"),
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
                          Predefinedmessage(text: "No problem!"),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              _messageController.text = "No problem!";
                              Navigator.of(context).pop();
                            },
                            child: Predefinedmessage(text: "No problem!"),
                          ),
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
              HeadPage(
                textUp: "Insert File",
                textDown: "choose your file from",
                image: Icon(
                  Icons.attach_file,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Insertfilechoice(
                          color: Colors.pink,
                          text: "Camera",
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Insertfilechoice(
                          color: Colors.green,
                          text: "Gallery",
                          icon: Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 35,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Insertfilechoice(
                        color: Colors.purple,
                        text: "Document",
                        icon: Icon(
                          Icons.insert_drive_file,
                          color: Colors.white,
                          size: 35,
                        ),
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
      appBar: AppBarW(
        text: headerText,
        icon: Icon(
          Icons.chevron_left,
          size: 40,
          color: Colors.white,
        ),
        //daly do boucle hnee
        image: Image.asset("assets/schooll.png"),
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
              padding: EdgeInsets.all(2.0),

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
                        maxLines: null,
                        keyboardType:
                            TextInputType.multiline, // Enables multiline input

                        focusNode: _focusNode,
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.lightBlue)),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: _messageController.text.isNotEmpty
                                ? 20
                                : 12, // Adjust vertical padding
                            horizontal: _isFocused ? 24 : 16,
                          ),
                          hintText: _editingMessageIndex == null
                              ? "Type a message"
                              : "Edit your message",
                        ),
                        onChanged: (value) {
                          setState(() {
                            visibilityy1 = value.isNotEmpty;
                          });
                        },
                        onSubmitted: (value) {
                          _sendMessage(value);

                          _messageController.clear();
                          setState(() {
                            visibilityy1 = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibilityy1,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue)),
                      child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () => {
                                _sendMessage(_messageController.text),
                                _messageController.clear(),
                                setState(() {
                                  visibilityy1 = false;
                                })
                              }),
                    ),
                  ),
                  Visibility(
                    visible: !visibilityy1,
                    child: Container(
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
