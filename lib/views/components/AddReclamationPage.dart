import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/components/Reclamation_structure.dart';
import 'package:flutter_switch/flutter_switch.dart';

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

  String priorite = 'Normal';
  String statut = 'Pending';
  String sujet = 'Scolarité';
  bool isUrgent = false; // false means "Normal", true means "Urgent"
  String description = '';

  @override
  void initState() {
    super.initState();
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
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "New Reclmation",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(height: 26),

                /*
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
                */

                buildDropdown('sujet', sujet, (value) {
                  setState(() {
                    sujet = value!;
                  });
                }, [
                  DropdownMenuItem(
                      value: 'Scolarité', child: Text('Scolarité')),
                  DropdownMenuItem(
                      value: 'Transport', child: Text('Transport')),
                ]),
                const SizedBox(height: 20.0),
                /*
                buildDropdown('Priorité', priorite, (value) {
                  setState(() {
                    priorite = value!;
                  });
                }, [
                  DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                  DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
                ]),
                */

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display current priority

                    /*
                    Text(
                      isUrgent ? 'Priority: Urgent' : 'Priority: Normal',
                      style: TextStyle(
                        fontSize: 15,
                        color: isUrgent ? Colors.red : Colors.green,
                      ),
                    ),
                    */
                    SizedBox(height: 18),

                    FlutterSwitch(
                      value: isUrgent,
                      onToggle: (value) {
                        setState(() {
                          isUrgent = value;
                        });
                      },
                      activeColor: Colors.red,
                      inactiveColor: Colors.green,
                      width: 500.0,
                      height: 40.0,
                      toggleSize: 30.0,
                      activeText: "Urgent",
                      inactiveText: "Normal",
                      showOnOff: true,
                    ),
                    SizedBox(height: 20),
                    Icon(
                      isUrgent ? Icons.warning : Icons.check_circle,
                      color: isUrgent ? Colors.red : Colors.green,
                      size: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                /*
                buildDropdown('Statut', statut, (value) {
                  setState(() {
                    statut = value!;
                  });
                }, [
                  DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                  DropdownMenuItem(value: 'Resolved', child: Text('Resolved')),
                  DropdownMenuItem(value: 'Progress', child: Text('Progress')),
                ]),
                */
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
                const SizedBox(height: 19),
                Container(
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(26),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onAdd(
                          Reclamation(
                            sujet: sujet,
                            priorite: priorite,
                            // statut: statut,
                            description: description,
                            //date: DateTime.now(), studentName: '',
                            //surname: "aaa",
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String value,
      ValueChanged<String?> onChanged, List<DropdownMenuItem<String>> items) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
            key: ValueKey(value),
            color: Colors.grey[600],
            size: 28,
          ),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
