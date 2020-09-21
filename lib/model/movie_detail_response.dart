import 'package:cubos_desafio_Tecnico_flutter/model/movie_detail.dart';
import 'package:flutter/foundation.dart';

class MovieDetailResponse {
  final MovieDetail movieDetail;
  final String error;

  MovieDetailResponse({
    @required this.movieDetail,
    @required this.error,
  });

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJson(json),
        error = "";

  MovieDetailResponse.withError(String errorValue)
      : movieDetail = MovieDetail(
          null,
          null,
          null,
          null,
          "",
          null,
          null,
          null,
          null,
        ),
        error = errorValue;
}
