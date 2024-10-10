import 'package:chat_edums/views/components/subComponents/priority.dart';
import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ReclamationCard extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard> {
  bool _isExpanded = false;
  final int _totalSegments = 5; // Total segments in the progress bar
  int _filledSegments = 3; // Default filled segments for normal

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.reclamation.priorite == 'Urgent' ? Colors.red : Colors.green;

    List<String> descriptionWords = widget.reclamation.description.split(' ');
    bool isLongDescription = descriptionWords.length > 5;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor, width: 1),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          //"ID: ${widget.reclamation.id}"
                          "", // Display ID
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            '${widget.reclamation.sujet}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        CircularBar1(
                            totalSteps: _totalSegments,
                            currentStep: _filledSegments),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/schooll.png",
                            width: 71, height: 80, fit: BoxFit.cover),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _isExpanded || !isLongDescription
                                ? '${widget.reclamation.description}'
                                : '${descriptionWords.take(2).join(' ')}...',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    if (isLongDescription)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(_isExpanded ? 'Show less' : 'Show more',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "By User",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // New Container on the right
              Container(
                width: 30,
                height: 125,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.reclamation.priorite == 'Urgent'
                        ? Colors.red
                        : Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      widget.reclamation.priorite == 'Urgent'
                          ? Colors.red.withOpacity(0.3)
                          : Colors.green.withOpacity(0.3),
                      widget.reclamation.priorite == 'Urgent'
                          ? Colors.red.withOpacity(0.1)
                          : Colors.green.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(_totalSegments, (index) {
                    Color segmentColor;

                    if (widget.reclamation.priorite == 'Urgent') {
                      _filledSegments = _filledSegments +
                          2; // Increment filled segments for urgent
                    }

                    if (index < _filledSegments) {
                      segmentColor = widget.reclamation.priorite == 'Urgent'
                          ? Colors.red
                          : Colors.green;
                    } else {
                      segmentColor = Colors.grey;
                    }

                    return _buildSegment(segmentColor);
                  })
                      .reversed
                      .toList(), // Reverse the list to fill from bottom to top
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildVerticalText(List<String> words) {
    List<Widget> verticalTextWidgets = [];
    for (int i = 0; i < words.length; i += 2) {
      String line =
          (i + 1 < words.length) ? '${words[i]} ${words[i + 1]}' : words[i];
      verticalTextWidgets.add(
        Text(
          line,
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontWeight: FontWeight.bold),
        ),
      );
    }
    return verticalTextWidgets;
  }

  Widget _buildSegment(Color color) {
    return Container(
      width: 10,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class CircularBar1 extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const CircularBar1({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CircularStepProgressIndicator(
        totalSteps: totalSteps,
        currentStep: currentStep,
        width: 40,
        height: 40,
        selectedColor: Colors.orange,
        unselectedColor: Colors.grey,
        roundedCap: (_, isSelected) => isSelected,
      ),
    );
  }
}
