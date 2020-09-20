import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'text_widget.dart';

class PrimaryTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabItems;

  PrimaryTabBar({
    Key key,
    @required this.tabController,
    @required this.tabItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      labelStyle: normalFont(MColors.textDark, 20.0),
      unselectedLabelStyle: normalFont(MColors.textDark, 20.0),
      unselectedLabelColor: MColors.textDark,
      indicator: BubbleTabIndicator(
        indicatorHeight: 25.0,
        indicatorColor: MColors.dark,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: tabItems.map((tabTitles) {
        return Container(
          height: 24.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
              width: 0.70,
              color: MColors.dark,
            ),
          ),
          child: Tab(
            child: PrimaryText(
              text: tabTitles,
              color: null,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
      controller: tabController,
    );
  }
}
