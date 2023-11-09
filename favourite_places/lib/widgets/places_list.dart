import 'package:favourite_places/data/dummy_places.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/widgets/places_item.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.placesList,
  });
  final List<Place> placesList;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: PlacesItem(
            place:
                Place(id: placesList[index].id, name: placesList[index].name),
          ),
        );
      },
    );
  }
}
