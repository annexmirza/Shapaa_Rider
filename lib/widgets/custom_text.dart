import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    required this.text,
  }) : super(key: key);
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? Colors.red),
    );
  }
}
