import 'package:flutter/material.dart';
import 'package:chat_edums/views/components/ReclamationCard.dart';
import 'package:chat_edums/views/components/appBar.dart';
import 'package:chat_edums/views/components/AddReclamationPage.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';

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
            // Card containing the filter dropdown
            Card(
              elevation: 3, // Adds shadow for a card effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      "Filtrer par priorité",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    Icon(Icons.filter_list, color: Colors.blueAccent),
                    const SizedBox(width: 10),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text("Sélectionner"),
                        value: filterPriority,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.blueAccent), // Custom dropdown icon
                        items: const [
                          DropdownMenuItem(value: null, child: Text('Aucun')),
                          DropdownMenuItem(
                              value: 'Normal', child: Text('Normal')),
                          DropdownMenuItem(
                              value: 'Urgent', child: Text('Urgent')),
                        ],
                        onChanged: filterReclamations,
                        dropdownColor: Colors.white,
                        borderRadius:
                            BorderRadius.circular(12), // Rounded dropdown
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: AddReclamationPage(onAdd: addReclamation),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
