import 'package:flutter/material.dart';
import 'package:chat_edums/components/notificationChnge.dart';
import 'package:get/get.dart'; // Assurez-vous d'importer GetX

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
        Get.toNamed('/chatScreen', arguments: text);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 13),
        // focus on it

        constraints: BoxConstraints(
            //maxWidth: 1,
            maxWidth: 500),

        height: 71,
        padding: const EdgeInsets.all(1),
        //width: 3,
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
            Image.asset(image), // Utilisez l'image passée en paramètre
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

// Exemple d'utilisation de CustomCard avec une liste de messages
class MessageList extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"text": "Scolarité", "date": "12/10/2023", "notificationCount": "5"},
    {"text": "Administration", "date": "12/10/2023", "notificationCount": "2"},
    {"text": "Cantine", "date": "12/10/2023", "notificationCount": "7"},
    {"text": "Transport", "date": "12/10/2023", "notificationCount": "3"},
    {"text": "Francais", "date": "12/10/2023", "notificationCount": "3"},
    {"text": "Anglais", "date": "12/10/2023", "notificationCount": "3"},
    {
      "images": "assets/back.jpg",
    },
    {
      "images": "assets/kids.jpg",
    },
    {
      "images": "assets/school.png",
    },
    {"images": "assets/stand.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return CustomCard(
          image: messages[index]['images']!, // Remplacez par l'image appropriée
          text: messages[index]["text"]!,
          date: messages[index]["date"]!,
          notificationCount: messages[index]["notificationCount"]!,
        );
      },
    );
  }
}
