import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'movie_card_widget.dart';
import 'text_widget.dart';

class MovieDetailsIWidget extends StatefulWidget {
  @override
  _MovieDetailsIWidgetState createState() => _MovieDetailsIWidgetState();
}

class _MovieDetailsIWidgetState extends State<MovieDetailsIWidget> {
  @override
  Widget build(BuildContext context) {
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
                  text: 'Mulan',
                  color: MColors.textDark,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 5.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "TÍTULO ORIGINAL: "),
                      TextSpan(
                        text: "MULAN",
                        style: boldFont(MColors.textDark, 11.0),
                      ),
                    ],
                    style: normalFont(Colors.grey, 10.0),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        grayContainer("Ano", "2019"),
                        SizedBox(
                          width: 15.0,
                        ),
                        grayContainer("Duração", "1h 20 min")
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        transparentContainer('Ação'),
                        SizedBox(
                          width: 10.0,
                        ),
                        transparentContainer('Aventura'),
                        SizedBox(
                          width: 10.0,
                        ),
                        transparentContainer('Sci-fi'),
                      ],
                    )
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
                    text:
                        '''Aventura sobre Carol Danvers, uma agente da CIA que tem contato com uma raça alienígena e ganha poderes sobre-humanos. Entre os seus poderes estão uma força fora do comum e a habilidade de voar.''',
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
                grayContainer('ORÇAMENTO', '\$ 152,000,000'),
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
