import 'package:chat_edums/views/components/subComponents/priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chat_edums/views/components/appBar.dart';
import 'package:get/get.dart';

void main() {
  runApp(ReclamationApp());
}

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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddReclamationPage(onAdd: addReclamation),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ReclamationCard extends StatelessWidget {
  final Reclamation reclamation;

  const ReclamationCard({Key? key, required this.reclamation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        reclamation.priorite == 'Urgent' ? Colors.red : Colors.grey;

    Color statusColor;
    if (reclamation.statut == 'Résolu') {
      statusColor = Colors.green.withOpacity(0.7);
    } else {
      statusColor = Colors.red.withOpacity(0.3);
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor, width: 2),
      ),
      elevation: 5,
      color: Colors.white.withOpacity(0.9),
      child: Stack(
        children: [
          if (reclamation.priorite == 'Urgent')
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                color: Colors.red,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      ' ${reclamation.sujet}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        '${reclamation.priorite}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '${reclamation.statut}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.red.withOpacity(0.4)),
                  ),
                  const SizedBox(height: 4.0),
                  Text(' ${reclamation.statut}'),
                  const SizedBox(height: 4.0),
                  Text(
                    ' ${reclamation.description}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 10,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
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
    super.initState(); // Make sure to call super.initState()
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
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                /*
                Priority(
                  text: priorite,
                  /*
                  onChanged: (value) {
                    setState(() {
                      priorite = value!;
                    });
                  },
                  */
                ),
                */
                const SizedBox(height: 28.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: statut,
                    decoration: const InputDecoration(
                      labelText: 'Statut',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(150.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: 'En attente', child: Text('En attente')),
                      DropdownMenuItem(value: 'Résolu', child: Text('Résolu')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        statut = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 28.0),
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
                    labelText: 'Description',
                  ),
                  onChanged: (value) => description = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Veuillez entrer une description' : null,
                ),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final reclamation = Reclamation(
                        sujet: sujet,
                        priorite: priorite,
                        statut: statut,
                        description: description,
                      );
                      widget.onAdd(reclamation);
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
