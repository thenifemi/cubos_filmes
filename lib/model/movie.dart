import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String poster;
  final String overview;

  Movie({
    @required this.id,
    @required this.title,
    @required this.poster,
    @required this.overview,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"];
}
