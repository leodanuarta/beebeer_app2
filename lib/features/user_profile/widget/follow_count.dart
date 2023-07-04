import 'package:beebeer_app2/theme/theme.dart';
import 'package:flutter/material.dart';

class FollowCount extends StatelessWidget {
  final int count;
  final String text;
  const FollowCount({super.key, required this.count, required this.text});

  @override
  Widget build(BuildContext context) {
    double fontSize = 18;
    return Row(
      children: [
        Text(
          '$count',
          style: TextStyle(
            color: Pallete.backgroundColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: Pallete.greyColor,
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
