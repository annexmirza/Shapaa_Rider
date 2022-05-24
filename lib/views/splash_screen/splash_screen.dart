import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/views/authentication/phone_auth_screen.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';

import '../../widgets/custom_text.dart';

// import 'package:tryme_taxi_consumer/controller/consumer_Conroller.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({Key? key}) : super(key: key);
// ConsumerController consumerController = Get.put(ConsumerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appDarkBlueColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 100.h,
                  child: CustomText(
                    color: appOrengeColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                    text: '''Welcome To
Shapaa''',
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 40.h,
                  child: CustomText(
                      color: appGreyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      text: '''Experience the luxury'''),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    width: 350.h,
                    height: 190.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/welcome2.png"),
                          fit: BoxFit.cover),
                    )),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 40.h,
                  child: CustomText(
                    text: ' Your safety, Our responsibilty!',
                    color: appGreyColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: customButton(
                height: 50.h,

                color: appOrengeColor,
                buttonTitle: 'GET STARTED',
                onpress: () {
                  Get.to(() => PhoneAuthScreen());
                },
                width: 200.h,
                // icon: Icons.arrow_forward_sharp,
              ),
            ),
          ],

          // Container(child:
          // Column(children: [],),
          // ,)
        ),
      ),
    );
  }
}
