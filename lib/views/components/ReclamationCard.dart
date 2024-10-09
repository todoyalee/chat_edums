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
  bool _isExpanded2 = false;
  String statut = "Progress";

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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "id911-dali",
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
                    const SizedBox(width: 135),

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
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        Opacity(
                          opacity: 0.4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1, vertical: 1),
                            decoration: BoxDecoration(
                              color: statut == 'Progress'
                                  ? Colors.orange
                                  : statut == 'Pending'
                                      ? Colors.red
                                      : Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              ' ${statut}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 120,
                          //height: 400,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //color: widget.reclamation.priorite == 'Urgent'
                        if (widget.reclamation.priorite == 'Normal')
                          Container(
                            height: 20,
                            color: Colors.green,
                            width: 60, // Adjust width as needed
                            child: Center(
                                child: Text('Normal',
                                    style: TextStyle(color: Colors.white))),
                          )
                        else
                          Container(
                            height: 20,
                            color: Colors.red,
                            width: 60, // Adjust width as needed
                            child: Center(
                                child: Text('Urgent',
                                    style: TextStyle(color: Colors.white))),
                          ),
                        // Additional containers for visual representation
                        ...List.generate(
                          widget.reclamation.priorite == 'Normal'
                              ? 3
                              : 5, // 3 for normal, 5 for urgent
                          (index) => Container(
                            margin: EdgeInsets.only(top: 4.0),
                            height: 15,
                            color: widget.reclamation.priorite == 'Normal'
                                ? Colors.green
                                : Colors.red,
                            width: 35, // Adjust width as needed
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
