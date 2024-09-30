import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';

class ReclamationCard extends StatelessWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        reclamation.priorite == 'Urgent' ? Colors.red : Colors.grey;
    Color statusColor = reclamation.statut == 'Résolu'
        ? Colors.green.withOpacity(0.7)
        : Colors.red.withOpacity(0.3);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor, width: 1),
      ),
      elevation: 6,
      child: Column(
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
              color: Colors.green,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/schooll.png",
                    width: 80, height: 80, fit: BoxFit.cover),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  ],
                ),
                SizedBox(
                  width: 65,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      //width: 45,
                    ),
                    Text(
                      ' ${reclamation.sujet}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' ${reclamation.description}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                        decoration: BoxDecoration(
                          color: reclamation.statut == 'Progress'
                              ? Colors.orange
                              : reclamation.statut == 'Pending'
                                  ? Colors.red
                                  : Colors.green, // Default to white if neither
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          ' ${reclamation.statut}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "By dali ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 8,
            width: double.infinity,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}
