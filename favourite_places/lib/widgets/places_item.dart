import 'package:flutter/material.dart';
import 'package:favourite_places/models/place.dart';

class PlacesItem extends StatelessWidget {
  const PlacesItem({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(place.name),
      ],
    );
  }
}
