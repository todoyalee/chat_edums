import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yearly/Monthly Toggle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwitchToggleDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwitchToggleDemo extends StatefulWidget {
  @override
  _SwitchToggleDemoState createState() => _SwitchToggleDemoState();
}

class _SwitchToggleDemoState extends State<SwitchToggleDemo> {
  bool isYearlySelected = true;

  // Tracks the switch state
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Options'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 230,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius:
                    BorderRadius.circular(30.0), // Circular border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Yearly Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYearlySelected = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isYearlySelected
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Text(
                            'Yearly',
                            style: TextStyle(
                              color: isYearlySelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Monthly Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isYearlySelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isYearlySelected
                              ? Colors.transparent
                              : Colors.black,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                              color: isYearlySelected
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Space between toggle and switch
            // Customized Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enable Feature',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 10),
                Switch(
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                  activeColor: Colors.black,
                  activeTrackColor: Colors.black54,
                  inactiveThumbColor: Colors.grey.shade600,
                  inactiveTrackColor: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
