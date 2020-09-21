import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';

class Cast {
  final int id;
  final String character;
  final String name;

  Cast(
    this.id,
    this.character,
    this.name,
  );

  Cast.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        character = json["character"],
        name = json["name"];
}
