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
      : id = json["cast_id"],
        character = json["character"],
        name = json["name"];
}

class Crew {
  final int id;
  final int name;

  Crew(this.id, this.name);
  Crew.fromJson(Map<String, dynamic> json)
      : id = json["credit_id"],
        name = json["name"];
}
