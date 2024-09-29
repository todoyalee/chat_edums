import 'package:chat_edums/views/components/subComponents/priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:chat_edums/views/components/appBar.dart';
import 'package:get/get.dart';

import 'package:flutter/rendering.dart';

void main() => runApp(ReclamationApp());

class ReclamationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reclamation Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReclamationPage(),
    );
  }
}

class Reclamation {
  final String sujet;
  final String priorite;
  final String statut;
  final String description;

  Reclamation({
    required this.sujet,
    required this.priorite,
    required this.statut,
    required this.description,
  });
}

class ReclamationPage extends StatefulWidget {
  @override
  _ReclamationPageState createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  final List<Reclamation> reclamations = [];
  String? filterPriority;

  String headerText = 'Reclamation';
  String image = 'default_image.png';

  void addReclamation(Reclamation reclamation) {
    setState(() {
      reclamations.add(reclamation);
    });
  }

  void filterReclamations(String? priority) {
    setState(() {
      filterPriority = priority;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW(
        text: headerText,
        icon: Icon(
          Icons.chevron_left,
          size: 40,
          color: Colors.white,
        ),
        image: Image.asset(image),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text("Filtrer par priorité"),
              value: filterPriority,
              underline: Container(),
              items: const [
                DropdownMenuItem(value: null, child: Text('Tous')),
                DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
              ],
              onChanged: filterReclamations,
            ),
            //),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: reclamations.length,
                itemBuilder: (context, index) {
                  final reclamation = reclamations[index];
                  return filterPriority == null ||
                          filterPriority == 'Tous' ||
                          reclamation.priorite == filterPriority
                      ? ReclamationCard(reclamation: reclamation)
                      : const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled:
                  true, // Allows the modal to take up more vertical space
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: AddReclamationPage(onAdd: addReclamation),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ReclamationCard extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.reclamation.priorite == 'Urgent' ? Colors.red : Colors.grey;

    return ScaleTransition(
        scale: Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          ),
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: borderColor, width: 2),
          ),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.reclamation.priorite == 'Urgent'
                    ? [Colors.red.shade200, Colors.red.shade100]
                    : [Colors.green.shade200, Colors.blue.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Avatar, Subject, and Date
                Row(
                  children: [
                    // Avatar for user or subject
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade200,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.reclamation.sujet,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            //date
                            "Date: ${widget.reclamation.description}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Priority Label as Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: widget.reclamation.priorite == 'Urgent'
                            ? Colors.red
                            : Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        widget.reclamation.priorite.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Progress Bar for Status
                Stack(
                  children: [
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 4,
                        width: widget.reclamation.statut == 'Résolu'
                            ? 100
                            : 50, // Adjust width based on status
                        decoration: BoxDecoration(
                          color: widget.reclamation.statut == 'Résolu'
                              ? Colors.green
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Description with Highlighted Words or Icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.description, color: Colors.blueGrey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                            children: [
                              const TextSpan(text: "Description: "),
                              TextSpan(
                                text: widget.reclamation.description,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Action Button with Icons for Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Status Icon with Tooltip
                    Tooltip(
                      message: widget.reclamation.statut == 'Résolu'
                          ? 'Resolved'
                          : 'Pending',
                      child: Icon(
                        widget.reclamation.statut == 'Résolu'
                            ? Icons.check_circle
                            : Icons.access_time,
                        color: widget.reclamation.statut == 'Résolu'
                            ? Colors.green
                            : Colors.orange,
                        size: 24,
                      ),
                    ),

                    // View Details Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add functionality here
                      },
                      icon: const Icon(Icons.arrow_forward, size: 18),
                      label: const Text('View Details'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.reclamation.priorite == 'Urgent'
                            ? Colors.red
                            : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class AddReclamationPage extends StatefulWidget {
  final Function(Reclamation) onAdd;

  const AddReclamationPage({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddReclamationPageState createState() => _AddReclamationPageState();
}

class _AddReclamationPageState extends State<AddReclamationPage> {
  String headerText = 'default text';
  String image = 'default_image.png';

  final _formKey = GlobalKey<FormState>();

  String sujet = '';

  String priorite = 'Normal';
  String statut = 'En attente';
  String description = '';

  void initState() {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    setState(() {
      headerText = arguments['text'] ?? 'default text';
      image = arguments['images'] ?? 'default_image.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
            /*
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            */
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //SizedBox(height: 25),
                Image.asset("assets/schooll.png"),
                SizedBox(height: 33),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    labelText: 'Sujet',
                  ),
                  onChanged: (value) => sujet = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Veuillez entrer un sujet' : null,
                ),
                const SizedBox(height: 28.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: DropdownButtonFormField<String>(
                    value: priorite,
                    decoration: InputDecoration(
                      labelText: 'Priorité',
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        key: ValueKey(priorite),
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                      DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        priorite = value!;
                      });
                    },
                    dropdownColor: Colors.white,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28.0,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: DropdownButtonFormField<String>(
                    value: statut,
                    decoration: InputDecoration(
                      labelText: 'Statut',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        key: ValueKey(priorite),
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: 'En attente', child: Text('Pending')),
                      DropdownMenuItem(
                          value: 'Résolu', child: Text('Resolved')),
                      DropdownMenuItem(
                          value: 'En cours', child: Text('Not resolved')),
                    ],
                    onChanged: (value) => setState(() {
                      statut = value!;
                    }),
                  ),
                ),
                const SizedBox(height: 28.0),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onChanged: (value) => description = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Veuillez entrer une description' : null,
                ),
                const SizedBox(height: 47),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(30),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onAdd(
                        Reclamation(
                          sujet: sujet,
                          priorite: priorite,
                          statut: statut,
                          description: description,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
