import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSize {
  final Color backgroundColor;
  final Widget leading;
  final Widget title;
  final PreferredSize bottom;
  final bool centerTile;
  final List<Widget> actions;

  const PrimaryAppBar({
    Key key,
    @required this.backgroundColor,
    this.leading,
    this.title,
    this.bottom,
    this.centerTile,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
      bottom: bottom,
      centerTitle: centerTile,
      actions: actions,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
