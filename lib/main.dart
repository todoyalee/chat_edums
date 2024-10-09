import 'package:flutter/material.dart';

void main() {
  runApp(SimpleTemperatureApp());
}

class SimpleTemperatureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Temperature App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureHomePage extends StatefulWidget {
  @override
  _TemperatureHomePageState createState() => _TemperatureHomePageState();
}

class _TemperatureHomePageState extends State<TemperatureHomePage> {
  // Current selected priority
  String _selectedPriority = 'Normal';

  // Sample temperature measurements
  List<TemperatureMeasurement> _measurements = [
    TemperatureMeasurement(location: 'Room 1', value: 22.5),
    TemperatureMeasurement(location: 'Room 2', value: 24.0),
    TemperatureMeasurement(location: 'Room 3', value: 23.0),
  ];

  // Function to get color based on priority
  Color _getColor(String priority) {
    switch (priority) {
      case 'Urgent':
        return Colors.red;
      case 'Normal':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Function to add a new measurement
  void _addMeasurement() {
    setState(() {
      // For demonstration, we'll add a random temperature
      double newTemp = 20 + (5 * (new DateTime.now().second % 10)) / 10;
      _measurements.add(
        TemperatureMeasurement(
          location: 'Room ${_measurements.length + 1}',
          value: newTemp,
        ),
      );
    });
  }

  // Function to remove a measurement
  void _removeMeasurement(int index) {
    setState(() {
      _measurements.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color priorityColor = _getColor(_selectedPriority);

    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Measurement'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Priority Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Urgent Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedPriority = 'Urgent';
                    });
                  },
                  // style: ElevatedButton.styleFrom(
                  //    _selectedPriority == 'Urgent'
                  //       ? Colors.red
                  //       : Colors.grey[300],
                  //   onPrimary: _selectedPriority == 'Urgent'
                  //       ? Colors.white
                  //       : Colors.black,
                  // ),
                  child: Text('Urgent'),
                ),
                SizedBox(width: 20),
                // Normal Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedPriority = 'Normal';
                    });
                  },
                  // style: ElevatedButton.styleFrom(
                  //   primary: _selectedPriority == 'Normal'
                  //       ? Colors.green
                  //       : Colors.grey[300],
                  //   onPrimary: _selectedPriority == 'Normal'
                  //       ? Colors.white
                  //       : Colors.black,
                  // ),
                  child: Text('Normal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Temperature Indicator
            Container(
              width: 100,
              height: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Thermometer SVG
                  // SvgPicture.asset(
                  //   'assets/svg/thermometer.svg',
                  //   width: 100,
                  //   height: 300,
                  //   color: Colors.grey[300],
                  // ),
                  // Colored Liquid
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 20,
                    height: (_selectedPriority == 'Urgent'
                        ? 200
                        : 100), // Adjust height
                    decoration: BoxDecoration(
                      color: priorityColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // Temperature Text
                  Positioned(
                    top: 10,
                    child: Text(
                      _selectedPriority == 'Urgent' ? 'High' : 'Low',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: priorityColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Temperature Measurements List
            Expanded(
              child: ListView.builder(
                itemCount: _measurements.length,
                itemBuilder: (context, index) {
                  TemperatureMeasurement measurement = _measurements[index];
                  return GestureDetector(
                    onLongPress: () => _removeMeasurement(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _selectedPriority == 'Urgent'
                            ? Colors.red[100]
                            : Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            measurement.location,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${measurement.value.toStringAsFixed(1)}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: _selectedPriority == 'Urgent'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Add Measurement Button
            ElevatedButton.icon(
              onPressed: _addMeasurement,
              icon: Icon(Icons.add),
              label: Text('Add Measurement'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model for Temperature Measurement
class TemperatureMeasurement {
  final String location;
  final double value;

  TemperatureMeasurement({required this.location, required this.value});
}
