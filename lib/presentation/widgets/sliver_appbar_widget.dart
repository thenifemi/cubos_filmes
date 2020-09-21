import 'package:flutter/material.dart';

import '../../core/credentials.dart';
import '../../model/movie.dart';
import '../utils/colors.dart';
import 'appbar_widget.dart';
import 'text_widget.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final Movie movie;
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.movie,
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    final boxShadow = [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0.3,
        blurRadius: 3,
        offset: Offset(0, 0.5), // changes position of shadow
      )
    ];

    return SizedBox(
      height: expandedHeight + expandedHeight,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: PrimaryAppBar(
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
                              text: 'Voltar',
                              color: MColors.textDark,
                              fontSize: 13.0)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: PrimaryText(
                      text: movie.title,
                      color: MColors.textDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50 * percent),
                child: Hero(
                  tag: 0.toString(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: boxShadow,
                    ),
                    height: 318.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        MOVIE_POSTER_PATH + movie.poster,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
