import 'package:cubos_desafio_Tecnico_flutter/model/genre_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_response.dart';
import 'package:dio/dio.dart';

import '../core/credentials.dart';

class MovieRepository {
  final String apikey = TMDB_API_KEY;
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getMoviesUrl = "$mainUrl/discover/movie";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPopularUrl = "$mainUrl/movie/top_rated";

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
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
      "language": "en-US",
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
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      print("Exception occured: $e stacktrace: $stacktrace");
      return MovieResponse.withError("$e");
    }
  }
}
