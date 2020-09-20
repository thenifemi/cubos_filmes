import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColors.whiteSmoke,
      child: Center(
        child: Container(
          height: 45.0,
          child: SvgPicture.asset(
            "assets/logos/Marca-Completa-Cubos-Branca.22e212f4.svg",
            height: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
