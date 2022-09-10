import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/controllers/order_controller.dart';
import 'package:shapaa_rider/models/earning_model.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class MyEarningsScreen extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    orderController.getMyORders();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appOrengeColor,
          title: Row(
            children: [
              CustomText(
                text: 'My Earnings',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.w,
              ),
              GetBuilder<OrderController>(builder: (orderController) {
                return CustomText(
                  text: 'Total: \$${orderController.totalEarning}',
                  color: Colors.white,
                  fontSize: 14.sp,
                );
              }),
            ],
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(20.sp),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: Get.width / 3.38,
                        child: CustomText(
                          text: 'Date',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: Get.width / 3.38,
                        child: CustomText(
                          text: 'Deliveries',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: Get.width / 3.38,
                        child: CustomText(
                          text: 'Earning',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  for (EarningModel earning in orderController.earnings)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: Get.width / 3.38,
                              child: CustomText(
                                text: '${earning.date}',
                                fontSize: 16.sp,
                              ),
                            ),
                            Container(
                              width: Get.width / 3.38,
                              child: CustomText(
                                text: '${earning.totalDeliveries}',
                                fontSize: 16.sp,
                              ),
                            ),
                            Container(
                              width: Get.width / 3.38,
                              child: CustomText(
                                text: '${earning.earning}',
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            );
          }),
        )));
  }
}
