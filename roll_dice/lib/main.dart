import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Color(0xffff7676), Color(0x99ff7676),
            Alignment.topLeft, Alignment.bottomRight),
      ),
    ),
  );
}
