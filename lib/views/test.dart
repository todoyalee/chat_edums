import 'package:flutter/material.dart';

import 'package:chat_edums/components/notificationChnge.dart';

class MessengerInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Static data for the cards
    final List<Map<String, dynamic>> items = [
      {'label': 'Scolarité', 'date': '12/09', 'number': 3},
      {'label': 'Administration', 'date': '11/09', 'number': 5},
      {'label': 'Cantine', 'date': '10/09', 'number': 2},
      {'label': 'Transport', 'date': '09/09', 'number': 1},
      {'label': 'Français', 'date': '08/09', 'number': 4},
      {'label': 'Anglais', 'date': '07/09', 'number': 6},
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Add your back navigation logic here
                  },
                ),
                Text(
                  'Message',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Icon(Icons.notifications, color: Colors.white), // Notifier icon
              ],
            ),
          ),
          // List of cards with spacing
          Expanded(
            child: ListView.builder(
              itemCount: items.length * 2 - 1, // Account for SizedBox
              itemBuilder: (context, index) {
                if (index.isEven) {
                  // Show the card
                  final item =
                      items[index ~/ 2]; // Integer division to get item index
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 190,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['label'],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          item['date'],
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Items: ${item['number']}',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Show SizedBox for spacing
                  return SizedBox(height: 16); // Adjust height as needed
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: MessengerInterface()));
}
