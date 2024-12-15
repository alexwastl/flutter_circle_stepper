import 'package:flutter_circle_stepper/flutter_circle_stepper.dart';
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
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterCircleStepper(
                stepperLength: 5,
                progressColor: Colors.blue,
                unfinishedColor: Colors.grey,
                // callbacks
                onStepTapped: (index) => debugPrint('Stepper at $index tapped'),
                onNext: () => debugPrint('Next pressed'),
                onPrevious: () => debugPrint('Previous pressed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
