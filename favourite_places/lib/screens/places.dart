import 'package:favourite_places/data/dummy_places.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/screens/new_places.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> _places = [];
  void _newPlace() async {
    final newPlace = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewPlacesScreen(),
        ));
    setState(() {
      _places.add(newPlace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: _newPlace, icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _places.isEmpty
            ? Center(
                child: Text(
                'No places to be displayed',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ))
            : PlacesList(
                placesList: _places,
              ),
      ),
    );
  }
}
