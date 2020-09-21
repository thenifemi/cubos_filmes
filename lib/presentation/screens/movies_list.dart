import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';
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
  final _tabItems = [
    "Ação",
    "Aventura",
    "Fantasia",
    "Comédia",
  ];

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: genres.length,
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

          // Scroll view body
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MovieDetailScreen(),
                      ),
                    );
                  },
                  child: PrimaryMovieCard(
                    heroTag: i.toString(),
                    movieImage: 'assets/images/mulan.jpg',
                    movieName: "Mulan",
                    movieGenre: "Ação - Aventura",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
