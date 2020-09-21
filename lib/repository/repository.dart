import 'package:cubos_desafio_Tecnico_flutter/model/cast_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/genre_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_detail_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_response.dart';
import 'package:dio/dio.dart';

import '../core/credentials.dart';

class MovieRepository {
  final String apikey = TMDB_API_KEY;
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getMoviesUrl = "$mainUrl/trending/movie/week";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPopularUrl = "$mainUrl/movie/top_rated";
  var movieUrl = "$mainUrl/movie";

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
      "page": 1,
    };

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return GenreResponse.withError("$e");
    }
  }

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return MovieResponse.withError("$e");
    }
  }

  Future<MovieResponse> getMovieByGenres(int id) async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
      "page": 1,
      "with_genre": id
    };

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return MovieResponse.withError("$e");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
    };
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return MovieDetailResponse.withError("$e");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      print(response.data);
      return CastResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return CastResponse.withError("$e");
    }
  }

  Future<CrewResponse> getCrew(int id) async {
    var params = {
      "api_key": apikey,
      "language": "pt-BR",
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      print(response.data);
      return CrewResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return CrewResponse.withError("$e");
    }
  }
}
