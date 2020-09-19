import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class PrimaryMovieCard extends StatelessWidget {
  final String heroTag;
  final String movieImage;
  final String movieName;
  final String movieGenre;

  const PrimaryMovieCard({
    Key key,
    @required this.heroTag,
    @required this.movieImage,
    @required this.movieName,
    @required this.movieGenre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: 520,

        //520px parecia um ajuste melhor do que 470px
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            //Movie Image backgroud
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  movieImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //Bottom shadow container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 161.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    end: const Alignment(0.0, -1),
                    begin: const Alignment(0.0, 0.0),
                    colors: <Color>[
                      const Color(0x8A000000),
                      Colors.black12.withOpacity(0.0)
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),

                        //Movie name
                        PrimaryText(
                          text: movieName,
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),

                        SizedBox(
                          height: 10.0,
                        ),

                        //Movie Genre
                        PrimaryText(
                          text: movieGenre,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
