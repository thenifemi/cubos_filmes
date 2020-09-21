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

Widget buildErrorWidget(error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Oops!! An error occured $error")],
    ),
  );
}
