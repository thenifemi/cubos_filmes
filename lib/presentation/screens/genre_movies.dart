import 'package:cubos_desafio_Tecnico_flutter/bloc/get_movie_byGenre.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/loading_widget.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/movie_card_widget.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'movie_details_screen.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;
  const GenreMovies({Key key, @required this.genreId}) : super(key: key);

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
        itemCount: 6,
        itemBuilder: (context, i) {
          var movie = movies[i];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(),
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
