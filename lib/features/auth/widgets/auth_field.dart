import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String titleText;
  final bool isPassword;
  const AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.titleText,
    required this.isPassword,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          widget.titleText,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      const SizedBox(height: 7),
      TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? !_showPassword : false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Pallete.pinkColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Pallete.greyColor,
              width: 1,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              widget.isPassword ? _togglevisibility() : DoNothingAction();
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: widget.isPassword ? Pallete.pinkColor : Colors.transparent,
            ),
          ),
        ),
      ),
    ]);
  }
}
