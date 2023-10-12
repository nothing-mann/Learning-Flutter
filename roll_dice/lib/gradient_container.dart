import 'package:flutter/material.dart';
import 'package:roll_dice/styled_text.dart';

class GradientContainer extends StatelessWidget {
  //const GradientContainer({key}) : super(key: key);
  const GradientContainer(this.color1, this.color2, this.begin, this.end,
      {super.key});
  final Color color1;
  final Color color2;
  final Alignment begin;
  final Alignment end;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [color1, color2], begin: begin, end: end),
      ),
      child: const Center(
        child: StyledText('Hey You'),
      ),
    );
  }
}
