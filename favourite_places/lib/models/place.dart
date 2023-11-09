import 'dart:io';
import 'package:uuid/uuid.dart';

var uuid = Uuid().v4();

class Place {
  Place({
    required this.name,
    required this.image,
  }) : id = uuid;
  final String id;
  final String name;
  final File image;
}
