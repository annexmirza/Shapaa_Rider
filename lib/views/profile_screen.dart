import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              height: Get.height - 31.h,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: Text(
                    'My Profile',
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 80.h,
                    width: Get.width,
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.png'),
                            radius: 30.r,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'John Doe',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15.sp,
                                  ),
                                  CustomText(
                                    text: '4.8',
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 30.h, bottom: 10.h, left: 10.w, right: 10.w),
                      height: 152.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Earned Today',
                            color: Colors.blueGrey,
                          ),
                          CustomText(
                            text: '\$0.00',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Total Trips',
                                    color: Colors.blueGrey,
                                  ),
                                  CustomText(
                                    text: '15',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Total Trips',
                                    color: Colors.blueGrey,
                                  ),
                                  CustomText(
                                    text: '15h 20m',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Total Distance',
                                    color: Colors.blueGrey,
                                  ),
                                  CustomText(
                                    text: '45 KM',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    height: 110.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Earnings',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: '\$1959.00',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Trip Earnings',
                              fontSize: 16.sp,
                              color: Colors.blueGrey,
                            ),
                            CustomText(
                              text: '\$1860.00',
                              fontSize: 16.sp,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Taxes',
                              fontSize: 16.sp,
                              color: Colors.blueGrey,
                            ),
                            CustomText(
                              text: '\$99.90',
                              fontSize: 16.sp,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
