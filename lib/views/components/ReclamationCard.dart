import 'package:flutter/material.dart';

import 'package:chat_edums/views/components/Reclamation_structure.dart';

class ReclamationCard extends StatefulWidget {
  final Reclamation reclamation;
  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.grey, width: 1),
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
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                                color: widget.reclamation.priorite == 'Urgent'
                                    ? Colors.red
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                ' ${widget.reclamation.priorite}',
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
                                ' ${widget.reclamation.sujet}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              if (_isExpanded) ...[
                                const SizedBox(height: 10),
                                Text(
                                  widget.reclamation.description,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (_isExpanded)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Opacity(
                                opacity: 0.4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: widget.reclamation.statut ==
                                            'Progress'
                                        ? Colors.orange
                                        : widget.reclamation.statut == 'Pending'
                                            ? Colors.red
                                            : Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    ' ${widget.reclamation.statut}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "By dali ",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      )
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
