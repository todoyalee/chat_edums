import 'package:flutter/material.dart';
import 'package:chat_edums/components/notificationChnge.dart';

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
    return Container(
      height: 71,
      padding: const EdgeInsets.all(1),
      width: double.infinity,
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
          Image.asset('assets/schooll.png'),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
    );
  }
}
