import 'package:flutter/material.dart';

import 'package:chat_edums/views/reclamation.dart';

import 'package:chat_edums/views/components/Reclamation_structure.dart';

class ReclamationDetails extends StatelessWidget {
  final Reclamation reclamation;

  const ReclamationDetails({Key? key, required this.reclamation})
      : super(key: key);

  double getProgressValue(String status) {
    switch (status) {
      case 'Resolved':
        return 1.0;
      case 'En Cours':
        return 0.5;
      case 'Non Resolved':
        return 0.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reclamation Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reclamation.sujet,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Status: ${reclamation.statut}",
                style: TextStyle(
                  fontSize: 18,
                  color: reclamation.statut == 'Resolved'
                      ? Colors.green
                      : reclamation.statut == 'En Cours'
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: getProgressValue(reclamation.statut),
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  reclamation.statut == 'Resolved'
                      ? Colors.green
                      : reclamation.statut == 'En Cours'
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Priority: ${reclamation.priorite}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: reclamation.priorite == 'Urgent'
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            "Date: ${reclamation.date.toLocal().toString().split(' ')[0]}",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Description:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        reclamation.description,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Edit'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.close),
                    label: Text('Close'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
