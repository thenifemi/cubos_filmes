import 'package:cubos_desafio_Tecnico_flutter/bloc/get_cast_bloc.dart';
import 'package:cubos_desafio_Tecnico_flutter/bloc/get_movie_details_bloc.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/movie_detail_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/cast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var budgetFormatter = NumberFormat("#,##0.00", "en_US");

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
                      TextSpan(text: detail.vote.toString()),
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
                        text: detail.originalTitle,
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
            child: Column(
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
                    grayContainer("Duração", detail.runtime.toString() + "min")
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: detail.genres.length,
                    itemBuilder: (context, i) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(width: 0.7, color: Colors.grey),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: PrimaryText(
                            text: detail.genres[i].name.toUpperCase(),
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
                grayContainer(
                    'ORÇAMENTO', '\$ ${budgetFormatter.format(detail.budget)}'),
                SizedBox(height: 5.0),
                grayContainer(
                    'PRODUTORAS',
                    detail.company.first == null
                        ? "No data"
                        : detail.company.first),
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
                  child: Container(
                    width: double.infinity,
                    height: 20.0,
                    child: CastWidget(id: movie.id),
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
