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
    return Scaffold(
      backgroundColor: Colors.white,
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
                expandedHeight: 303.0,
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
