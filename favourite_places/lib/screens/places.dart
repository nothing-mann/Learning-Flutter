//import 'package:favourite_places/data/dummy_places.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/screens/new_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
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
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: _newPlace, icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userPlaces.isEmpty
            ? Center(
                child: Text(
                'No places to be displayed',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ))
            : PlacesList(
                placesList: userPlaces,
              ),
      ),
    );
  }
}
