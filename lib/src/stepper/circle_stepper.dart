import 'package:circle_stepper/src/widgets/circle_avatar.dart';
import 'package:circle_stepper/src/widgets/progress_dot.dart';
import 'package:flutter/material.dart';

const double currentDotSize = 15;
const double dotSize = 10;

/// Custom navigation component that displays a progress stepper with dots
class CircleStepper extends StatefulWidget {
  const CircleStepper({
    super.key,
    required this.stepperLength,
    this.onNext,
    this.onPrevious,
    required this.progressColor,
    required this.unfinishedColor,
    this.onStepTapped,
  });

  /// determines the length of the navigation dots
  final int stepperLength;

  /// Color of progress dots
  final Color progressColor;

  /// Color of dots that are not progressed
  final Color unfinishedColor;

  /// optional callback when the next arrow is tapped
  final VoidCallback? onNext;

  /// optional callback when the previous arrow is tapped
  final VoidCallback? onPrevious;

  /// optional callback that returns the current step index when a step is tapped
  final Function(int)? onStepTapped;

  @override
  State<CircleStepper> createState() => CircleStepperState();
}

class CircleStepperState extends State<CircleStepper> {
  int currentIndex = 0;

  void onNext() {
    if (currentIndex != widget.stepperLength - 1) {
      setState(() {
        currentIndex++;
      });

      widget.onNext?.call();
    }
  }

  void onPrevious() {
    if (currentIndex != 0) {
      setState(() {
        currentIndex--;
      });
      widget.onPrevious?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // App stepper
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.stepperLength,
                (index) => ProgressDot(
                  size: index == currentIndex ? currentDotSize : dotSize,
                  dotColor: index > currentIndex
                      ? widget.unfinishedColor
                      : widget.progressColor,
                ),
              ),
            ),
          ],
        ),
        // Navigation
        Row(
          children: [
            currentIndex != 0
                ? CustomCircleAvatar(
                    onTap: () {
                      onPrevious();
                      widget.onStepTapped?.call(currentIndex);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                    background: Colors.white,
                  )
                : const SizedBox(),
            const SizedBox(width: 10),
            CustomCircleAvatar(
              onTap: () {
                onNext();
                widget.onStepTapped?.call(currentIndex);
              },
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              background: widget.progressColor,
            ),
          ],
        ),
      ],
    );
  }
}
