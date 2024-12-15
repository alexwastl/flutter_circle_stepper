A simple circle stepper to display progress in a Flutter app. 

## Features

<img src="https://github.com/alexwastl/flutter_circle_stepper/raw/main/assets/stepper_preview.png" alt="screenshot" width="400"/>

## Usage

```dart
FlutterCircleStepper(
    stepperLength: 5,
    progressColor: Colors.blue,
    unfinishedColor: Colors.grey,
    // optional callbacks for stepper interaction 
    onStepTapped: (index) => debugPrint('Stepper at $index tapped'),
    onNext: () => debugPrint('Next pressed'),
    onPrevious: () => debugPrint('Previous pressed'),
),
```

## Additional information

Contribute via GitHub: https://github.com/alexwastl/flutter_circle_stepper 
