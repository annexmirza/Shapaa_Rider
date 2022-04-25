import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';

class PhoneAuthScreen extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
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
                      height: 345.h,
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
                            height: 246.h,
                            width: 347.w,
                          ),
                          Center(
                              child: CustomText(
                            text: 'Phone Login',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          )),
                        ],
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 48.sp, right: 48.sp, top: 48.sp),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIconColor: Colors.white,
                        labelStyle: GoogleFonts.nunito(fontSize: 16.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      initialCountryCode: 'PK',
                      onChanged: (phone) {
                        authController.phoneController.text =
                            phone.completeNumber;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 48.sp, right: 48.sp),
                    child: CustomText(
                      text:
                          '''If you continue, you may receive an SMS for verification. Message and data rates may apply.''',
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(48.sp),
                    child: CustomBtn(
                      text: 'Continue',
                      onPressed: () {
                        authController.registerWithPhoneCredentials();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
