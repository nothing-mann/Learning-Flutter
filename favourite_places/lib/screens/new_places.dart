//import 'package:favourite_places/models/place.dart';
import 'dart:io';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlacesScreen extends ConsumerWidget {
  const NewPlacesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File? selectedImage;
    var _enteredName = '';

    void _savePlace() {
      if (_enteredName.isEmpty || selectedImage == null) {
        return;
      }
      ref.read(userPlacesProvider.notifier).addPlace(
            _enteredName,
            selectedImage!,
          );
      Navigator.of(context).pop(
          //Place(name: _enteredName)
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to your place'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                onChanged: (value) {
                  _enteredName = value;
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(
                onSelectedImage: (image) {
                  selectedImage = image;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _savePlace,
                child: const Text('Save Place'),
              ),
            ],
          ))),
    );
  }
}
