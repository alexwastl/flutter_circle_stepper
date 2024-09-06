import 'package:flutter/material.dart';

/// default background color
const backgroundColor = Colors.grey;

/// Widget that displays a circle avatar containing an icon
class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.icon,
    this.background,
    this.onTap,
    this.radiusData,
  });
  final Icon icon;
  final Color? background;
  final VoidCallback? onTap;
  final double? radiusData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radiusData ?? 20,
        backgroundColor: background ?? backgroundColor,
        child: icon,
      ),
    );
  }
}
