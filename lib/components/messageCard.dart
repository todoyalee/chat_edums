import 'package:flutter/material.dart';
import 'package:chat_edums/components/notificationChnge.dart';

class CustomRowItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String date;
  final String notificationCount;

  const CustomRowItem({
    super.key,
    required this.icon,
    required this.text,
    required this.date,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 30, color: Colors.blueAccent),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Column(
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Notificationchnge(notificationCount: notificationCount),
            ],
          ),
        ],
      ),
    );
  }
}
