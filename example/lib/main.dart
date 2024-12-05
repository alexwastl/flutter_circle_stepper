import 'package:circle_stepper/flutter_circle_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterCircleStepper(
                stepperLength: 5,
                progressColor: Colors.blue,
                unfinishedColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
