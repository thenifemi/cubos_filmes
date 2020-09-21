import 'package:flutter/material.dart';

import '../../bloc/get_movie_byGenre.dart';
import '../../model/movie.dart';
import '../../model/movie_response.dart';
import 'loading_widget.dart';
import 'movie_card_widget.dart';
import '../screens/movie_details_screen.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;
  const GenreMovies({Key key, this.genreId}) : super(key: key);

  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;
  _GenreMoviesState(this.genreId);

  @override
  void initState() {
    super.initState();
    moviesByGenreBloc..getMovieByGenre(genreId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: moviesByGenreBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return buildErrorWidget(snapshot.data.error);
              }
              return buildGenreMoviesWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return buildErrorWidget(snapshot.error);
            } else {
              return loadingWidget();
            }
            break;
          case ConnectionState.waiting:
            return loadingWidget();
            break;
          default:
            print("null");

            return loadingWidget();
        }
      },
    );
  }

  Widget buildGenreMoviesWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return buildErrorWidget("No Movies");
    } else
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, i) {
          var movie = movies[i];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(
                    movie: movie,
                  ),
                ),
              );
            },
            child: PrimaryMovieCard(
              heroTag: movie.id.toString(),
              movieImage: movie.poster,
              movieName: movie.title,
              movieGenre: "Ação - Aventura",
            ),
          );
        },
      );
  }
}
