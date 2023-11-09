import 'package:uuid/uuid.dart';
import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';

class NewPlacesScreen extends StatelessWidget {
  const NewPlacesScreen({super.key});
  @override
  Widget build(context) {
    var _enteredName = '';
    var uuid = Uuid().v4();
    void _savePlace() {
      Navigator.of(context).pop(Place(id: uuid, name: _enteredName));
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
              ),
              ElevatedButton(
                onPressed: _savePlace,
                child: Text('Save Place'),
              ),
            ],
          ))),
    );
  }
}
