import 'package:flutter/material.dart';
import 'package:stepper_navigation/stepper_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Add your widgets
            StepperNavigation(
              stepperLength: 5,
              onNext: () => setState(() {
                currentIndex++;
              }),
              onPrevious: () => setState(() {
                currentIndex = currentIndex - 1;
              }),
              currentIndex: currentIndex,
              progressColor: Colors.orange,
              unfinishedColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
