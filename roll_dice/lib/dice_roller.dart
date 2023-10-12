import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roll_dice/styled_text.dart';

var randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentValue = 1;
  void rollDice() {
    setState(() {
      currentValue = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice$currentValue.png', height: 250),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: rollDice,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.greenAccent,
                backgroundColor: Colors.amberAccent),
            child: const StyledText('They see me rolling')),
      ],
    );
  }
}
