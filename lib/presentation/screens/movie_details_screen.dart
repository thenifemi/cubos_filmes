import 'package:cubos_desafio_Tecnico_flutter/presentation/utils/colors.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/appbar_widget.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../widgets/movie_details_widget.dart';
import '../widgets/sliver_appbar_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key key, @required this.movie}) : super(key: key);
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie movie;

  _MovieDetailScreenState(this.movie);
  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0.3,
        blurRadius: 3,
        offset: Offset(0, 0.5), // changes position of shadow
      )
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        backgroundColor: MColors.whiteSmoke,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 80.0,
                height: 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  boxShadow: boxShadow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: MColors.textDark,
                      size: 13.54,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    PrimaryText(
                        text: 'Voltar', color: MColors.textDark, fontSize: 13.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            //sliver appbar widget
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                movie: movie,
                expandedHeight: 250.0,
              ),
            ),

            //movie details widget
            SliverFillRemaining(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    MovieDetailsIWidget(
                      movie: movie,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
