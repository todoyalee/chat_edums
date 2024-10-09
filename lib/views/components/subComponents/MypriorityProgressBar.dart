import 'package:flutter/material.dart';

class pb extends StatefulWidget {
  const pb({super.key});

  @override
  State<pb> createState() => _pbState();
}

class _pbState extends State<pb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                )),
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                )),
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                )),
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                )),
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
