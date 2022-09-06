import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  String text;
  var onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 56.h,
        width: 321.w,
        decoration: BoxDecoration(
          color: Color(0XffF8774A),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: CustomText(
            text: '$text',
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Widget customButton(
    {Function? onpress,
    String buttonTitle = '',
    color,
    Color titlecolor = Colors.white,
    double? width,
    double? height,
    var icon}) {
  return InkWell(
    onTap: () {
      onpress!();
    },
    child: Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(0.r), color: color),
      child: Center(
        child: Text(
          buttonTitle,
          style: GoogleFonts.comicNeue(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: titlecolor,
            ),
          ),
        ),
      ),
    ),
  );
}
