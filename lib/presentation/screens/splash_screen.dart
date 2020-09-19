import 'package:cubos_desafio_Tecnico_flutter/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
