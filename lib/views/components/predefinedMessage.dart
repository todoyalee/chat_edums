import 'package:flutter/material.dart';

class Predefinedmessage extends StatelessWidget {
  final String text;
  const Predefinedmessage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(text),
    );
  }
}
