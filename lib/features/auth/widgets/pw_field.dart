import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';

class PwField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String titleText;

  const PwField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.titleText});

  @override
  State<PwField> createState() => _PwFieldState();
}

class _PwFieldState extends State<PwField> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.titleText,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        TextFormField(
            controller: widget.controller,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Pallete.pinkColor,
                  width: 3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Pallete.greyColor,
                  width: 3,
                ),
              ),
              contentPadding: const EdgeInsets.all(22),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglevisibility();
                },
                child: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Pallete.pinkColor,
                ),
              ),
            )),
      ],
    );
  }
}
