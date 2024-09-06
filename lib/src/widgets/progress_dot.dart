import 'package:flutter/widgets.dart';

const double defaultDotSize = 10;
const double defaultSpacing = 5.0;

/// A dot to indicate the progress of defined steps, utilised in the welcome tour
class ProgressDot extends StatelessWidget {
  const ProgressDot(
      {super.key, required this.dotColor, this.size, this.spacing});

  /// Color of the progress dot
  final Color dotColor;

  /// Size of a progress dot
  final double? size;

  /// Spacing between the progress dots
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? defaultDotSize,
      width: size ?? defaultDotSize,
      margin: EdgeInsets.all(spacing ?? defaultSpacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dotColor,
      ),
    );
  }
}
