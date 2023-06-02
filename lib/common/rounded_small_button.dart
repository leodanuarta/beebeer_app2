import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';

class RoundedSmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const RoundedSmallButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Pallete.pinkColor,
    this.textColor = Pallete.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label, 
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
      backgroundColor: backgroundColor,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 5
      ),
    );
  }
}
