import 'package:cubos_desafio_Tecnico_flutter/bloc/get_genres_bloc.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/genre.dart';
import 'package:cubos_desafio_Tecnico_flutter/model/genre_response.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/movie_card_widget.dart';
import '../widgets/tabBar_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/textfield_widget.dart';
import 'movie_details_screen.dart';

class Home extends StatefulWidget {
  final List<Genre> genres;
  Home(this.genres);

  @override
  _HomeState createState() => _HomeState(genres);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _HomeState(this.genres);

  TabController _tabController;
  final _tabItems = [
    "Ação",
    "Aventura",
    "Fantasia",
    "Comédia",
  ];

  @override
  void initState() {
    genresBloc..getGenre();
    _tabController = TabController(
      initialIndex: 0,
      length: _tabItems.length,
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
              return loadingWidget();
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return _buildErrorWidget(snapshot.data.error);
                }
                return buildMoviesWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else {
                return loadingWidget();
              }
              break;
            case ConnectionState.waiting:
              return loadingWidget();
              break;
            default:
              return loadingWidget();
          }
        },
      ),
    );
  }

  Widget buildMoviesWidget(GenreResponse data) {
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

  Widget _buildErrorWidget(error) {}
}
