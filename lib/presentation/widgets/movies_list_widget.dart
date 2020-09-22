import 'package:flutter/material.dart';

import '../../model/genre.dart';
import 'tabBar_widget.dart';
import 'genre_movies_widget.dart';

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

    final action = genres.where((g) => g.id == 28);
    final adventure = genres.where((g) => g.id == 12);
    final fantasy = genres.where((g) => g.id == 35);
    final comedy = genres.where((g) => g.id == 14);

    final tabBarviews = [
      action.first.id,
      adventure.first.id,
      fantasy.first.id,
      comedy.first.id,
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
              children: tabBarviews.map((id) {
                return GenreMovies(
                  genreId: id,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
