import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/get_genres_bloc.dart';
import '../../model/genre.dart';
import '../../model/genre_response.dart';
import '../utils/colors.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/movies_list_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    genresBloc..getGenre();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105.0),
        child: Column(
          children: [
            //AppBar
            PrimaryAppBar(
              backgroundColor: Colors.white,
              title: PrimaryText(
                  text: 'Filmes',
                  color: MColors.textDark,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),

            //Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryTextField(
                controller: null,
                onSaved: null,
                labelText: "Pesquise filmes",
                prefix: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: genresBloc.subject.stream,
        builder: (BuildContext context, AsyncSnapshot<GenreResponse> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return buildErrorWidget(snapshot.data.error);
                }
                return buildMoviesWidget(snapshot.data);
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
      ),
    );
  }

  Widget buildMoviesWidget(GenreResponse data) {
    List<Genre> genres = data.genres;

    if (genres.length == 0) {
      return buildErrorWidget("No Movie");
    } else
      return MoviesList(
        genres: genres,
      );
  }
}
