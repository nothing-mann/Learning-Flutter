import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.place});
  final Place place;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
    );
  }
}
