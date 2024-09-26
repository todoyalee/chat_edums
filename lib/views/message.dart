import 'package:flutter/material.dart';
import 'package:chat_edums/components/messageCard.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/chatScreen.dart';

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
  // List of messages with their details
  final List<Map<String, String>> messages = [
    {
      "text": "Scolarité",
      "date": "12/10/2023",
      "notificationCount": "5",
      "images": "assets/back.jpg",
    },
    {
      "text": "Administration",
      "date": "12/10/2023",
      "notificationCount": "2",
      "images": "assets/stand.jpg",
    },
    {
      "text": "Cantine",
      "date": "12/10/2023",
      "notificationCount": "7",
      "images": "assets/schooll.png",
    },
    {
      "text": "Transport",
      "date": "12/10/2023",
      "notificationCount": "3",
      "images": "assets/schooll.png",
    },
    {
      "text": "Francais",
      "date": "12/10/2023",
      "notificationCount": "3",
      "images": "assets/stand.jpg"
    },
    {
      "text": "Anglais",
      "date": "12/10/2023",
      "notificationCount": "3",
      "images": "assets/schooll.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                "Messages",
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return CustomCard(
                      image: message["images"]!,
                      text: message["text"]!,
                      date: message["date"]!,
                      notificationCount: message["notificationCount"]!,
                    );
                    //const SizedBox(height: 20),
                    //],
                    //);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 85),
                  Container(
                    width: 200,
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 25),
                        Icon(Icons.message, color: Colors.white),
                        const SizedBox(width: 25),
                        Text(
                          'Add Message',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Optional spacing below the button
            ],
          ),
        ),
      ),
    );
  }
}
