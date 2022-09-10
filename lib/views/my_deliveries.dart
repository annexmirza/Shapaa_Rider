import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/controllers/order_controller.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class MyDeliveries extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    orderController.getMyORders();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appOrengeColor,
          title: CustomText(
            text: 'My Deliveries',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(20.sp),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return Column(
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
                        text: 'Distance',
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
                for (OrderModel order in orderController.myOrders)
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
                              text: '${order.orderDate}',
                              fontSize: 16.sp,
                            ),
                          ),
                          Container(
                            width: Get.width / 3.38,
                            child: CustomText(
                              text: '${order.distance} km',
                              fontSize: 16.sp,
                            ),
                          ),
                          Container(
                            width: Get.width / 3.38,
                            child: CustomText(
                              text: '${order.deliveryFees}',
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            );
          }),
        )));
  }
}
