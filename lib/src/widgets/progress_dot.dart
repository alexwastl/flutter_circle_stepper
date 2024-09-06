import 'package:flutter/widgets.dart';

const double defaultDotSize = 10;

/// A dot to indicate the progress of defined steps, utilised in the welcome tour
class ProgressDot extends StatelessWidget {
  const ProgressDot({super.key, required this.dotColor, this.size});

  final Color dotColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? defaultDotSize,
      width: size ?? defaultDotSize,
      margin: const EdgeInsets.all(12.0), // TODO: Check margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dotColor,
      ),
    );
  }
}
