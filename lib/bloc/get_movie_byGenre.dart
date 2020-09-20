import 'package:cubos_desafio_Tecnico_flutter/model/movie_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/repository.dart';

class MoviesListByGenreBloc {
  final MovieRepository _repository = MovieRepository();
  // ignore: close_sinks
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovieByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenres(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();
