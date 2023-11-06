import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
