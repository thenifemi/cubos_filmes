import 'package:cubos_desafio_Tecnico_flutter/model/movie_response.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/repository.dart';

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  // ignore: close_sinks
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieBloc = MoviesListBloc();
