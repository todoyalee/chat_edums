import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Animated Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedCardList(),
    );
  }
}

class AnimatedCardList extends StatefulWidget {
  @override
  _AnimatedCardListState createState() => _AnimatedCardListState();
}

class _AnimatedCardListState extends State<AnimatedCardList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Sample data for cards
  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'Server Maintenance',
      'priority': 'High',
      'status': 'Pending',
      'description':
          'The server will undergo maintenance from 2 AM to 4 AM. Please save your work.',
    },
    {
      'title': 'Software Update',
      'priority': 'Low',
      'status': 'Resolved',
      'description': 'The software update was completed successfully.',
    },
    {
      'title': 'Database Backup',
      'priority': 'High',
      'status': 'Not Resolved',
      'description':
          'The database backup failed. Please check the logs for details.',
    },
    {
      'title': 'Security Patch',
      'priority': 'High',
      'status': 'Pending',
      'description':
          'A new security patch is available. Please install it as soon as possible.',
    },
    {
      'title': 'Feature Request',
      'priority': 'Low',
      'status': 'Resolved',
      'description':
          'The feature request has been implemented and is now available in the next release.',
    },
    {
      'title': 'User Feedback',
      'priority': 'Low',
      'status': 'Pending',
      'description':
          'We have received user feedback regarding the latest update. Please review it.',
    },
    {
      'title': 'System Downtime',
      'priority': 'High',
      'status': 'Not Resolved',
      'description':
          'The system experienced downtime last night. An investigation is ongoing.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Start the animation for the first build
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildCard(Map<String, dynamic> card) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.9, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
        ),
      ),
      child: Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: card['priority'] == 'High'
                  ? [Colors.red.shade200, Colors.red.shade100]
                  : [Colors.green.shade200, Colors.green.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Topic
              Text(
                card['title']!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              // Priority
              Row(
                children: [
                  Icon(
                    card['priority'] == 'High'
                        ? Icons.priority_high
                        : Icons.low_priority,
                    color:
                        card['priority'] == 'High' ? Colors.red : Colors.green,
                  ),
                  SizedBox(width: 5),
                  Text(
                    card['priority'],
                    style: TextStyle(
                      fontSize: 16,
                      color: card['priority'] == 'High'
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Status
              Row(
                children: [
                  Icon(
                    card['status'] == 'Pending'
                        ? Icons.access_time
                        : card['status'] == 'Resolved'
                            ? Icons.check_circle
                            : Icons.cancel,
                    color: card['status'] == 'Pending'
                        ? Colors.orange
                        : card['status'] == 'Resolved'
                            ? Colors.green
                            : Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(
                    card['status'],
                    style: TextStyle(
                      fontSize: 16,
                      color: card['status'] == 'Pending'
                          ? Colors.orange
                          : card['status'] == 'Resolved'
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Description
              Text(
                card['description'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beautiful Animated Cards')),
      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          return buildCard(cardData[index]);
        },
      ),
    );
  }
}
