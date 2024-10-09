import 'package:chat_edums/views/components/subComponents/priority.dart';
import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class ReclamationCard extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  String statut = "Progress";

  String _selectedPriority = 'Normal'; // Default priority
  final int _totalSegments = 5; // Total segments in the progress bar
  int _filledSegments = 3; // Default filled segments for normal

  // Method to update the filled segments based on selected priority
  void _updatePriority(String priority) {
    setState(() {
      _selectedPriority = priority;
      if (priority == 'Normal') {
        _filledSegments = 3; // Normal has fewer filled segments
      } else {
        _filledSegments = _totalSegments; // Urgent is fully filled
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.reclamation.priorite == 'Urgent' ? Colors.red : Colors.green;

    /*
    Color statusColor = widget.reclamation.statut == 'Resolved'
        ? Colors.green.withOpacity(0.7)
        : Colors.red.withOpacity(0.3);
        */

    List<String> descriptionWords = widget.reclamation.description.split(' ');
    bool isLongDescription = descriptionWords.length > 5;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded2 = !_isExpanded2;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                  //color: Colors.red,
                ),
              if (widget.reclamation.priorite == 'Normal')
                Container(
                  height: 8,
// i don't know if i shall put a color or not
                  width: double.infinity,
                  //color: Colors.green,
                ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "id911 \n -dali",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset("assets/schooll.png",
                            width: 71, height: 80, fit: BoxFit.cover),
                      ],
                    ),

                    const SizedBox(width: 55),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 8, vertical: 4),
                    //       decoration: BoxDecoration(
                    //         color: widget.reclamation.priorite == 'Urgent'
                    //             ? Colors.red
                    //             : Colors.green,
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Text(
                    //         ' ${widget.reclamation.priorite}',
                    //         style: const TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' ${widget.reclamation.sujet}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        const SizedBox(height: 10),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_isExpanded || !isLongDescription)
                                ..._buildVerticalText(descriptionWords)
                              else
                                Text(
                                  '${descriptionWords.take(2).join(' ')}...',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
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

                    const SizedBox(width: 25),
                    Column(
                      children: [
                        CircularBar1(
                          totalSteps: _totalSegments, // Use your defined value
                          currentStep:
                              _filledSegments, // Use your defined value
                        ),
                        // More chi
                      ],
                    ),

                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 125,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: widget.reclamation.priorite == 'Urgent'
                                    ? Colors.red
                                    : Colors.green,
                                width: 2),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                widget.reclamation.priorite == 'Urgent'
                                    ? Colors.red.withOpacity(0.3)
                                    : Colors.green.withOpacity(0.3),
                                widget.reclamation.priorite == 'Urgent'
                                    ? Colors.red.withOpacity(0.1)
                                    : Colors.green.withOpacity(0.1)
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
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Align children at the bottom
                            children: List.generate(_totalSegments, (index) {
                              Color segmentColor;

                              if (widget.reclamation.priorite == 'Normal') {
                                // No additional filled segments for 'Normal'
                              } else if (widget.reclamation.priorite ==
                                  'Urgent') {
                                _filledSegments = _filledSegments +
                                    2; // Increment filled segments for urgent
                              }

                              if (index < _filledSegments) {
                                segmentColor =
                                    widget.reclamation.priorite == 'Urgent'
                                        ? Colors.red
                                        : Colors.green;
                              } else {
                                segmentColor = Colors.grey;
                              }

                              // Return the segment with the correct color
                              return _buildSegment(segmentColor);
                            })
                                .reversed
                                .toList(), // Reverse the list to fill from bottom to top for green
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: widget.reclamation.priorite == 'Urgent'
                                ? Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.check),



                          // Text(
                          //   ' ${widget.reclamation.priorite}',
                          //   style: const TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ),
                        */

                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8, vertical: 4),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   child: Icon(
                        //     Icons.pending,
                        //     color: Colors.red,
                        //     size: 40,
                        //   ),
                        // )
                      ],
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
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return verticalTextWidgets;
  }
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

class CircularBar1 extends StatelessWidget {
  final int totalSteps; // You can pass this dynamically
  final int currentStep; // You can pass this dynamically

  const CircularBar1({
    Key? key,
    this.totalSteps = 10,
    this.currentStep = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              CircularStepProgressIndicator(
                totalSteps: 10,
                currentStep: 6,
                width: 80,
                selectedColor: Colors.orange,
                unselectedColor: Colors.grey,
                roundedCap: (_, isSelected) => isSelected,
              ),
              // Centered Icon
              Icon(
                Icons.check, // Change this to your desired icon
                color: Colors.orange,
                size: 40, // Adjust the size of the icon
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pendin extends StatefulWidget {
  const Pendin({super.key});

  @override
  State<Pendin> createState() => _PendinState();
}

class _PendinState extends State<Pendin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Row(
      children: [
        Container(
          width: 160,
          height: 150,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    )),
                SizedBox(width: 25),
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    )),
                SizedBox(width: 25),
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        )
      ],
    )));
  }
}

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 90,
          height: 90,
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.done,
              color: Colors.green,
              size: 43,
            ),
          ),
        ),
      ),
    );
  }
}
