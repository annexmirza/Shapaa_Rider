import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:shapaa_rider/views/authentication/signup_screen.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/custom_btn.dart';

class OtpScreen extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XffBCBABA),
      body: SingleChildScrollView(
        child: GetBuilder<AuthController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 285.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Image.asset(
                          'assets/logo.png',
                          height: 225.h,
                          width: 347.w,
                        ),
                        // Center(child: Text('OTP',style: GoogleFonts.poppins(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),)),
                      ],
                    )),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0.w, right: 10.w, top: 30.h),
                  child: Text(
                    "Enter the 6-digit code sent to your number.",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(48.sp),
                  child: Pinput(
                    length: 6,
                    onCompleted: (pin) =>
                        authController.verifyPhoneNumber(otp: pin),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(49.sp),
                  child: CustomBtn(
                    text: 'Continue',
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
