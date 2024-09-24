import 'package:flutter/material.dart';
import 'package:chat_edums/components/notificationChnge.dart';
import 'package:chat_edums/components/messageCard.dart'; // Make sure to import the file where `CustomCard` is defined
import 'package:get/get.dart';
import 'package:chat_edums/views/chatScreen.dart';

void main() {
  runApp(const message());
}

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
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
          body: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                'assets/back.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 4,
                ),

                const SizedBox(height: 10),

                // Wrap each CustomCard in GestureDetector for navigation
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(headerText: "Scolarité"),
                      ),
                    );
                  },
                  child: const CustomCard(
                    image: "assets/schooll.png",
                    text: "Scolarité",
                    date: "12/10/2023",
                    notificationCount: "5",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(headerText: "Administration"),
                      ),
                    );
                  },
                  child: CustomCard(
                    image: "assets/schooll.png",
                    text: "Administration",
                    date: "12/10/2023",
                    notificationCount: "2",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(headerText: "Cantine"),
                      ),
                    );
                  },
                  child: CustomCard(
                    image: "assets/schooll.png",
                    text: "Cantine",
                    date: "12/10/2023",
                    notificationCount: "7",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(headerText: "Transport"),
                      ),
                    );
                  },
                  child: CustomCard(
                    image: "assets/schooll.png",
                    text: "Transport",
                    date: "12/10/2023",
                    notificationCount: "3",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(headerText: "Francais"),
                      ),
                    );
                  },
                  child: CustomCard(
                    image: "images/schooll.png",
                    text: "Francais",
                    date: "12/10/2023",
                    notificationCount: "3",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(headerText: "Anglais"),
                      ),
                    );
                  },
                  child: CustomCard(
                    image: "images/schooll.png",
                    text: "Anglais",
                    date: "12/10/2023",
                    notificationCount: "3",
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 85,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
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
              ],
            ),
          ]),
        ));
  }
}
