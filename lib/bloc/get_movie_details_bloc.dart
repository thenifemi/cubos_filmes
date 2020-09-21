import 'package:cubos_desafio_Tecnico_flutter/model/movie_detail_response.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../model/cast_response.dart';
import '../repository/repository.dart';

class MovieDetailsBloc {
  final MovieRepository _repository = MovieRepository();
  // ignore: close_sinks
  final BehaviorSubject<MovieDetailResponse> _subject =
      BehaviorSubject<MovieDetailResponse>();

  getMovieDetails(int id) async {
    MovieDetailResponse response = await _repository.getMovieDetail(id);
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

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
}

final movieDetailsBloc = MovieDetailsBloc();
