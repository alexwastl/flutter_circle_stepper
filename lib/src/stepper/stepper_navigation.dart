import 'package:flutter/material.dart';
import 'package:stepper_navigation/src/widgets/circle_avatar.dart';
import 'package:stepper_navigation/src/widgets/progress_dot.dart';

const double currentDotSize = 15;
const double dotSize = 10;

/// Custom navigation component that displays a progress stepper with dots
class StepperNavigation extends StatefulWidget {
  const StepperNavigation(
      {super.key,
      required this.stepperLength,
      required this.onNext,
      required this.onPrevious,
      required this.currentIndex,
      required this.progressColor,
      required this.unfinishedColor});

  /// determines the length of the navigation dots
  final int stepperLength;

  /// Color of progress dots
  final Color progressColor;

  /// Color of dots that are not progressed
  final Color unfinishedColor;

  /// current index of the app stepper
  final int currentIndex;

  /// callback when the next arrow is tapped
  final VoidCallback onNext;

  /// callback when the previous arrow is tapped
  final VoidCallback onPrevious;

  @override
  State<StepperNavigation> createState() => StepperNavigationState();
}

class StepperNavigationState extends State<StepperNavigation> {
  void onNext() {
    widget.onNext.call();
  }

  void onPrevious() {
    if (widget.currentIndex != 0) {
      widget.onPrevious.call();
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
                  size: index == widget.currentIndex ? currentDotSize : dotSize,
                  dotColor: index > widget.currentIndex
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
            widget.currentIndex != 0
                ? CustomCircleAvatar(
                    onTap: () {
                      onPrevious();
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
