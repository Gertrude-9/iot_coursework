import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CloudHeightScreen(),
    );
  }
}

class CloudHeightScreen extends StatefulWidget {
  @override
  _CloudHeightScreenState createState() => _CloudHeightScreenState();
}

class _CloudHeightScreenState extends State<CloudHeightScreen> {
  double dryBulb = 0;
  double wetBulb = 0;
  double cloudHeight = 0;

  void calculateCloudHeight() {
    cloudHeight = (dryBulb - wetBulb) * 400;
    setState(() {});
  }

  void simulateSensorData() {
    setState(() {
      dryBulb = Random().nextDouble() * 25 + 10;
      wetBulb = dryBulb - Random().nextDouble() * 5;
      calculateCloudHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Height Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Calculate Cloud Height",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Dry Bulb Temperature: ${dryBulb.toStringAsFixed(2)}°C",
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                Text(
                  "Wet Bulb Temperature: ${wetBulb.toStringAsFixed(2)}°C",
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                Text(
                  "Cloud Height: ${cloudHeight.toStringAsFixed(2)} ft",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: simulateSensorData,
                  child: Text("Simulate Sensor Data"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                Divider(height: 30, color: Colors.grey[400]),
                const Text(
                  "Why Cloud Height Matters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Knowing the height of clouds is crucial for pilots. Low clouds can reduce visibility and lead to turbulence, "
                      "which is risky for aviation. This app helps you calculate cloud height using simple temperatures.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
