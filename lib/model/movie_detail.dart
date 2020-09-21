import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';

class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final List<dynamic> company;
  final String releaseDate;
  final int runtime;
  final double vote;
  final String originalTitle;

  MovieDetail(
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.releaseDate,
    this.runtime,
    this.vote,
    this.originalTitle,
    this.company,
  );

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        genres = (json["genres"] as List)
            .map(
              (i) => Genre.fromJson(i),
            )
            .toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"],
        vote = json["vote_average"],
        originalTitle = json["original_title"],
        company = (json['production_companies'] as List)
            .map((i) => i['name'])
            .toList();
}
