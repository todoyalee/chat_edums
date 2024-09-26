import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  final String textUp;
  final String textDown;
  final Icon image;

  const HeadPage({
    super.key,
    required this.textUp,
    required this.textDown,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.blue),
        child: Row(children: [
          /*
          Icon(


            
            Icons.attach_file,
            color: Colors.white,
            size: 40,
          ),
          */
          image,
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(textUp,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Opacity(
                opacity: 0.7,
                child: Text(textDown, style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ]));
  }
}
