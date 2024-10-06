import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';

class ReclamationCard extends StatelessWidget {
  final Reclamation reclamation;
  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Color borderColor =
                reclamation.priorite == 'Urgent' ? Colors.red : Colors.green;
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (reclamation.priorite == 'Urgent')
                    Container(
                      height: 8,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                  if (reclamation.priorite == 'Normal')
                    Container(
                      height: 8,
                      width: double.infinity,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/schooll.png",
                          width: 71,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: reclamation.priorite == 'Urgent'
                                    ? Colors.red
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                ' ${reclamation.priorite}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                ' ${reclamation.sujet}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                reclamation.description,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Opacity(
                          opacity: 0.4,
                          // child: Container(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 1, vertical: 1),
                          //   decoration: BoxDecoration(
                          //     color: reclamation.statut == 'Progress'
                          //         ? Colors.orange
                          //         : reclamation.statut == 'Pending'
                          //             ? Colors.red
                          //             : Colors.green,
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   child: Text(
                          //     ' ${reclamation.statut}',
                          //     style: const TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "By dali ",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the pop-up
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //side: BorderSide(color: borderColor, width: 1),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/schooll.png",
                width: 71,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: reclamation.priorite == 'Urgent'
                            ? Colors.red
                            : Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        ' ${reclamation.priorite}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reclamation.sujet,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
