import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/notificationChnge.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String text;
  final String date;
  final String notificationCount;

  const CustomCard({
    super.key,
    required this.image,
    required this.text,
    required this.date,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/chatScreen', arguments: {
          'text': text,
          'image': image,
        });
      },
      child: Container(
        //margin: const EdgeInsets.only(bottom: 13),
        //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        margin: const EdgeInsets.fromLTRB(16, 0, 18, 13),

/*
        constraints: BoxConstraints(
            //maxWidth: 1,
            maxWidth: 500),
*/
        height: 71,
        padding: const EdgeInsets.all(1),
        width: 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Notificationchnge(notificationCount: notificationCount),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      "text": "Scolarité",
      "date": "12/10/2023",
      "notificationCount": "5",
      "images": "assets/schooll.png",
    },
    {
      "text": "Administration",
      "date": "12/10/2023",
      "notificationCount": "2",
      "images": "assets/schooll.png",
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
      "images": "assets/schooll.png",
    },
    {
      "text": "Anglais",
      "date": "12/10/2023",
      "notificationCount": "3",
      "images": "assets/schooll.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return CustomCard(
          image: messages[index]['images']!,
          text: messages[index]["text"]!,
          date: messages[index]["date"]!,
          notificationCount: messages[index]["notificationCount"]!,
        );
      },
    );
  }
}
