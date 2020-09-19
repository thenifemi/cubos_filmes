import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/movie_card_widget.dart';
import '../widgets/tabBar_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/textfield_widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
      length: _tabItems.length,
      vsync: this,
    );
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
      body: Padding(
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
                  return PrimaryMovieCard(
                    heroTag: i.toString(),
                    movieImage: 'assets/images/mulan.jpg',
                    movieName: "Mulan",
                    movieGenre: "Ação - Aventura",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
