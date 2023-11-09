//import 'package:favourite_places/data/dummy_places.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/place_details.dart';
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
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: FileImage(placesList[index].image),
          ),
          title: PlacesItem(
            place: Place(
                name: placesList[index].name, image: placesList[index].image),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlaceDetails(place: placesList[index]),
            ));
          },
        );
      },
    );
  }
}
