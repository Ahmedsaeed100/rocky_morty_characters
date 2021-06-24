import 'package:rocky_morty_characters/models/origin.dart';

class Results {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Origin location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin:
            json['origin'] != null ? new Origin.fromJson(json['origin']) : null,
        location: json['location'] != null
            ? new Origin.fromJson(json['location'])
            : null,
        image: json['image'],
        episode: json['episode'].cast<String>(),
        url: json['url'],
        created: json['created']);
  }
}
