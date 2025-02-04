import 'originModel.dart';
import 'locationModel.dart';

class Character {
  late int charID;
    late String name;
  late String statusIfDeadOrAlive;
  late String species;
  late String type;
  late String gender;
  late Origin origin;
  late Location? location; // This should be the class field
  late String image;
  late List<String> episode;
  late String url;
  late String created;

  Character.fromJson(Map<String, dynamic> json) {
    charID = json['id'];
    name = json['name'];
    statusIfDeadOrAlive = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];

    // Handling origin
    if (json['origin'] != null) {
      origin = Origin.fromJson(json['origin']);
    } else {
      origin = Origin(origin_name: "Unknown", origin_url: "");
    }

    // Handling location
    if (json['location'] != null) {
      location = Location.fromJson(json['location']); // Correct assignment here
    } else {
      location = null; // Handle case where location is null
    }

    image = json['image'] ?? "";

    // Safely converting episode to List<String>
    if (json['episode'] != null && json['episode'] is List) {
      episode = List<String>.from(json['episode'].map((e) => e.toString()));
    } else {
      episode = [];
    }

    url = json['url'] ?? "";
    created = json['created'] ?? "";
  }
}





