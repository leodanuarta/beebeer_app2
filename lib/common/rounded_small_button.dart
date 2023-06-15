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
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: onTap,
      color: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
