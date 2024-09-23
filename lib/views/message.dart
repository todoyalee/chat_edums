import 'package:flutter/material.dart';
import 'package:chat_edums/components/notificationChnge.dart';
import 'package:chat_edums/components/messageCard.dart'; // Make sure to import the file where `CustomCard` is defined
import 'package:get/get.dart';

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
          body: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                'images/back.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.blueAccent,
                  child: Row(
                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          size: 35,
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 95,
                      ),
                      const Text(
                        'Messages',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      const Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const CustomCard(
                  image: "images/schooll.png",
                  text: "Scolarité",
                  date: "12/10/2023",
                  notificationCount: "5",
                ),
                const SizedBox(height: 20),
                CustomCard(
                  image: "images/schooll.png",
                  text: "Administration",
                  date: "12/10/2023",
                  notificationCount: "2",
                ),
                const SizedBox(height: 20),
                CustomCard(
                  image: "images/schooll.png",
                  text: "Cantine",
                  date: "12/10/2023",
                  notificationCount: "7",
                ),
                const SizedBox(height: 20),
                CustomCard(
                  image: "images/schooll.png",
                  text: "Transport",
                  date: "12/10/2023",
                  notificationCount: "3",
                ),
                const SizedBox(height: 20),
                CustomCard(
                  image: "images/schooll.png",
                  text: "Francais",
                  date: "12/10/2023",
                  notificationCount: "3",
                ),
                const SizedBox(height: 20),
                CustomCard(
                  image: "images/schooll.png",
                  text: "Anglais",
                  date: "12/10/2023",
                  notificationCount: "3",
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
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
