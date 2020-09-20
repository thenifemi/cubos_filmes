import 'package:flutter/foundation.dart';

import 'movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse({
    @required this.movies,
    @required this.error,
  });

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map(
              (i) => Movie.fromJson(i),
            )
            .toList(),
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = List(),
        error = errorValue;
}
