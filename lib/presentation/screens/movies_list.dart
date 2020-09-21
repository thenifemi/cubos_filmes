import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/screens/genre_movies.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/movie_card_widget.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/tabBar_widget.dart';
import 'package:flutter/material.dart';

import 'movie_details_screen.dart';

class MoviesList extends StatefulWidget {
  final List<Genre> genres;
  MoviesList({@required this.genres, Key key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState(genres);
}

class _MoviesListState extends State<MoviesList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _MoviesListState(this.genres);

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _tabItems = [
      genres[0].name,
      genres[1].name,
      genres[8].name,
      genres[3].name,
    ];
    final List<int> _tabItemsId = [
      genres[0].id,
      genres[1].id,
      genres[8].id,
      genres[3].id,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          //Tabbar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: PrimaryTabBar(
                tabController: _tabController,
                tabItems: _tabItems,
              ),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: _tabItems.map((x) {
                return GenreMovies(genreId: 4);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
