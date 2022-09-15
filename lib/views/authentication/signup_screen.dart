import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/custom_text.dart';

class SignUpScreen extends StatelessWidget {

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffBCBABA),
      body: SingleChildScrollView(child: GetBuilder<AuthController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 245.h,
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
                        height: 30.h,
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: 205.h,
                        width: 347.w,
                      ),
                      // Center(child: Text('OTP',style: GoogleFonts.poppins(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),)),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.h),
                child: Form(
                  key: authController.signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: authController.updatePersonalInfo ? "Personal Information" : 'Sign Up',
                        fontSize: 30.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        labelText: 'First Name',
                        hintText: 'Enter your First Name',
                        controller: authController.firstNameController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        labelText: 'Last Name',
                        hintText: 'Enter your Last Name',
                        controller: authController.lastNameController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomFormField(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        controller: authController.emailController,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 48.sp, vertical: 10.h),
                child: CustomBtn(
                    text: authController.updatePersonalInfo ? "Update" : 'Continue',
                    onPressed: () {
                      authController.validateSignUpForm();
                    }),
              )
            ],
          );
        },
      )),
    );
  }
}
