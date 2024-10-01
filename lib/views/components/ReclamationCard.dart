import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';

class ReclamationCard extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.reclamation.priorite == 'Urgent' ? Colors.red : Colors.grey;
    Color statusColor = widget.reclamation.statut == 'Resolved'
        ? Colors.green.withOpacity(0.7)
        : Colors.red.withOpacity(0.3);

    List<String> descriptionWords = widget.reclamation.description.split(' ');
    bool isLongDescription = descriptionWords.length > 5;

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor, width: 1),
      ),
      elevation: 6,
      child: Column(
        children: [
          if (widget.reclamation.priorite == 'Urgent')
            Container(
              height: 8,
              width: double.infinity,
              color: Colors.red,
            ),
          if (widget.reclamation.priorite == 'Normal')
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
                        color: widget.reclamation.priorite == 'Urgent'
                            ? Colors.red
                            : Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        ' ${widget.reclamation.priorite}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 65),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        ' ${widget.reclamation.sujet}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _isExpanded || !isLongDescription
                                  ? widget.reclamation.description
                                  : '${descriptionWords.take(5).join(' ')}...',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.bold),
                            ),
                            if (isLongDescription)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded; 
                                  });
                                },
                                child: Text(
                                  _isExpanded ? 'Show less' : 'Show more',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                        decoration: BoxDecoration(
                          color: widget.reclamation.statut == 'Progress'
                              ? Colors.orange
                              : widget.reclamation.statut == 'Pending'
                                  ? Colors.red
                                  : Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          ' ${widget.reclamation.statut}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
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
