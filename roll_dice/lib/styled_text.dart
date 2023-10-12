import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xffff7676),
          fontWeight: FontWeight.w600,
          fontSize: 28.0),
    );
  }
}
