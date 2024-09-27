import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

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
  String image = 'assets/schooll.png';

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
      appBar: AppBar(
        title: Text(headerText),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 40),
          onPressed: () => Navigator.pop(context),
        ),
        //flexibleSpace: Image.asset(image, fit: BoxFit.cover),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
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
            ),
            Expanded(
              child: VerticalCardPager(
                titles: reclamations
                    .where((rec) =>
                        filterPriority == null ||
                        filterPriority == 'Tous' ||
                        rec.priorite == filterPriority)
                    .map((rec) => rec.sujet)
                    .toList(),
                images: reclamations
                    .where((rec) =>
                        filterPriority == null ||
                        filterPriority == 'Tous' ||
                        rec.priorite == filterPriority)
                    .map((rec) => ReclamationCard(reclamation: rec))
                    .toList(),
                onPageChanged: (page) {},
                initialPage: 0,
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
    Color statusColor = reclamation.statut == 'Résolu'
        ? Colors.green.withOpacity(0.7)
        : Colors.red.withOpacity(0.3);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor, width: 2),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Ensures proper alignment of text
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sujet: ${reclamation.sujet}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Ensures text does not overflow
                        maxLines: 1, // Limits the subject to one line
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Priorité: ${reclamation.priorite}',
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Statut: ${reclamation.statut}',
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Description: ${reclamation.description}',
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow
                            .ellipsis, // Avoids overflow in case of long description
                        maxLines: 3, // Limits description to 3 lines
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Image.asset("assets/r.png",
                    width: 80, height: 80, fit: BoxFit.cover),
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

class AddReclamationPage extends StatefulWidget {
  final Function(Reclamation) onAdd;

  const AddReclamationPage({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddReclamationPageState createState() => _AddReclamationPageState();
}

class _AddReclamationPageState extends State<AddReclamationPage> {
  final _formKey = GlobalKey<FormState>();

  String sujet = '';
  String priorite = 'Normal';
  String statut = 'En attente';
  String description = '';

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
                SizedBox(height: 20),
                Image.asset("assets/schooll.png"),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Sujet',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => sujet = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Veuillez entrer un sujet' : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: priorite,
                  decoration: InputDecoration(
                    labelText: 'Priorité',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                    DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
                  ],
                  onChanged: (value) => setState(() {
                    priorite = value!;
                  }),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: statut,
                  decoration: const InputDecoration(
                    labelText: 'Statut',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'En attente', child: Text('En attente')),
                    DropdownMenuItem(value: 'Résolu', child: Text('Résolu')),
                    DropdownMenuItem(
                        value: 'En cours', child: Text('En cours')),
                  ],
                  onChanged: (value) => setState(() {
                    statut = value!;
                  }),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => description = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Veuillez entrer une description' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onAdd(Reclamation(
                        sujet: sujet,
                        priorite: priorite,
                        statut: statut,
                        description: description,
                      ));
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
