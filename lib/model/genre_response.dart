import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';
import 'package:flutter/foundation.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse({
    @required this.genres,
    @required this.error,
  });

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genres = (json["genres"] as List)
            .map(
              (i) => Genre.fromJson(i),
            )
            .toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      : genres = List(),
        error = errorValue;
}
