import 'package:rxdart/rxdart.dart';

import '../model/genre_response.dart';
import '../repository/repository.dart';

class GenresListBloc {
  final MovieRepository _repository = MovieRepository();
  // ignore: close_sinks
  final BehaviorSubject<GenreResponse> _subject =
      BehaviorSubject<GenreResponse>();

  getGenre() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenresListBloc();
