import 'package:cubos_desafio_Tecnico_flutter/bloc/get_movie_details_bloc.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_detail_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'loading_widget.dart';
import 'movie_card_widget.dart';
import 'text_widget.dart';

class MovieDetailsIWidget extends StatefulWidget {
  final Movie movie;

  const MovieDetailsIWidget({Key key, @required this.movie}) : super(key: key);
  @override
  _MovieDetailsIWidgetState createState() => _MovieDetailsIWidgetState(movie);
}

class _MovieDetailsIWidgetState extends State<MovieDetailsIWidget> {
  final Movie movie;
  _MovieDetailsIWidgetState(this.movie);

  @override
  void initState() {
    super.initState();
    movieDetailsBloc..getMovieDetails(movie.id);
  }

  @override
  void dispose() {
    super.dispose();
    movieDetailsBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: movieDetailsBloc.subject.stream,
      builder:
          (BuildContext context, AsyncSnapshot<MovieDetailResponse> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return buildErrorWidget(snapshot.data.error);
              }
              return buildMovieDetailsWidget(snapshot.data);
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

  Widget buildMovieDetailsWidget(MovieDetailResponse data) {
    var detail = data.movieDetail;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),

          //Rating Container
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "7.3 "),
                      TextSpan(
                        text: "/ 10 ",
                        style: normalFont(Colors.grey, 16.0),
                      ),
                    ],
                    style: boldFont(MColors.textDark, 26.0),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),

          //Title Container
          Container(
            child: Column(
              children: [
                PrimaryText(
                  text: movie.title,
                  color: MColors.textDark,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 5.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Titulo original: "),
                      TextSpan(
                        text: movie.title,
                        style: normalFont(MColors.textDark, 12.0),
                      ),
                    ],
                    style: normalFont(Colors.grey, 11.0),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),

          //Year, Duration and Genre Container
          Container(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        grayContainer("Ano", detail.releaseDate),
                        SizedBox(
                          width: 15.0,
                        ),
                        grayContainer("Duração", detail.runtime.toString())
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: detail.genres.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child:
                                  transparentContainer(detail.genres[i].name),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 50.0),

          //Description Container
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: 'Descrição',
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: movie.overview,
                    color: MColors.textDark,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30.0),

          //Income and Production Container
          Container(
            child: Column(
              children: [
                grayContainer('ORÇAMENTO', '\$ ${detail.budget}'),
                SizedBox(height: 5.0),
                grayContainer('PRODUTORAS', 'MARVEL STUDIOS'),
              ],
            ),
          ),
          SizedBox(height: 30.0),

          //Crew Container
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: 'Diretor',
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: 'Ryan Fleck, Anna Boden',
                    color: MColors.textDark,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: 'Elenco',
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text:
                        'Brie Larson, Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace',
                    color: MColors.textDark,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
