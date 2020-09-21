import 'package:flutter/cupertino.dart';

Widget loadingWidget() {
  return Container(
    child: Center(
      child: CupertinoActivityIndicator(
        radius: 12.0,
      ),
    ),
  );
}
