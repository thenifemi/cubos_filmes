import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../model/cast_response.dart';
import '../repository/repository.dart';

class CastBloc {
  final MovieRepository _repository = MovieRepository();
  // ignore: close_sinks
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getGenre(int id) async {
    CastResponse response = await _repository.getCasts(id);
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

  BehaviorSubject<CastResponse> get subject => _subject;
}

final castBloc = CastBloc();
