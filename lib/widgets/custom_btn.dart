import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: CustomText(
            text: '$text',
            color: Colors.red,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
