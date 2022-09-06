import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class MyEarningScreen extends StatelessWidget {
  const MyEarningScreen({Key? key}) : super(key: key);

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
                    'My Earning',
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Total Earning',
                              color: Colors.blueGrey,
                            ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            CustomText(
                              text: '\$54.00',
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Container(
                            width: 150.w, child: CustomBtn(text: 'withdraw')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 450.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: LineChart(LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                getTitlesWidget: (value, TitleMeta metaData) {
                                  // switch (value.toInt()) {
                                  //   case 2:
                                  //     return CustomText(text: 'MAR');
                                  //   case 5:
                                  //     return CustomText(text: 'APR');
                                  //   case 8:
                                  //     return CustomText(text: 'MAY');
                                  // }
                                  return CustomText(text: '');
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                getTitlesWidget: (value, TitleMeta metaData) {
                                  // switch (value.toInt()) {
                                  //   case 2:
                                  //     return CustomText(text: '10k');
                                  //   case 5:
                                  //     return CustomText(text: '20k');
                                  //   case 8:
                                  //     return CustomText(text: '20k');
                                  // }
                                  return CustomText(text: '');
                                },
                              ),
                            ),
                          )))),
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
