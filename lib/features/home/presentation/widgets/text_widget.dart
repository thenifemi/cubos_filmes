import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  // final double fontSize;
  // final double fontSize;
  // final double fontSize;

  const PrimaryText({
    Key key,
    @required this.text,
    @required this.color,
    @required this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

//TextStyles---------------------------------------
TextStyle boldFont(Color color, double size) {
  return GoogleFonts.montserrat(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.w600,
  );
}

TextStyle normalFont(Color color, double size) {
  return GoogleFonts.montserrat(
    color: color,
    fontSize: size,
  );
}
