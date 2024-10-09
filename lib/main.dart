import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureProgressBarApp());
}

class TemperatureProgressBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Progress Bar',
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
  // Current temperature value (0 to 100)
  double _temperature = 50.0;

  // Function to increase temperature
  void _increaseTemperature() {
    setState(() {
      if (_temperature < 100) {
        _temperature += 10;
      }
    });
  }

  // Function to decrease temperature
  void _decreaseTemperature() {
    setState(() {
      if (_temperature > 0) {
        _temperature -= 10;
      }
    });
  }

  // Function to determine progress bar color based on temperature
  Color _getProgressColor(double temperature) {
    if (temperature <= 50) {
      return Colors.green;
    } else if (temperature <= 75) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  // Function to get temperature status text
  String _getTemperatureStatus(double temperature) {
    if (temperature <= 50) {
      return 'Normal';
    } else if (temperature <= 75) {
      return 'Elevated';
    } else {
      return 'Urgent';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color progressColor = _getProgressColor(_temperature);
    String statusText = _getTemperatureStatus(_temperature);

    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Progress Bar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Display Current Temperature
            Text(
              'Current Temperature: ${_temperature.toInt()}°C',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
            SizedBox(height: 20),
            // Progress Bar
            LinearProgressIndicator(
              value: _temperature / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 20,
            ),
            SizedBox(height: 10),
            // Temperature Status
            Text(
              statusText,
              style: TextStyle(
                fontSize: 18,
                color: progressColor,
              ),
            ),
            SizedBox(height: 40),
            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrease Button
                ElevatedButton(
                  onPressed: _decreaseTemperature,
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.blue, // Button color
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  ),
                  child: Text(
                    'Decrease',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 20),
                // Increase Button
                ElevatedButton(
                  onPressed: _increaseTemperature,
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.blue, // Button color
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  ),
                  child: Text(
                    'Increase',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
