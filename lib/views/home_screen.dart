import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shapaa_rider/controllers/map_controller.dart';
import 'package:shapaa_rider/controllers/order_controller.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  OrderController orderController = Get.put(OrderController());
  MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    orderController.getNewOrders();
    mapController.getCurrentLocation();
    // orderController.duplicate();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 20.r,
              ),
              Center(
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.blueAccent),
                  child: Center(
                    child: CustomText(
                      text: 'Online',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            height: Get.height,
            child: Stack(
              children: [
                GetBuilder<MapController>(builder: (mapController) {
                  return mapController.myLocation == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GoogleMap(
                          scrollGesturesEnabled: true,
                          zoomGesturesEnabled: true,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(mapController.myLocation!.latitude,
                                mapController.myLocation!.longitude),
                            zoom: 15,
                          ),
                        );
                }),
                GetBuilder<OrderController>(builder: (orderController) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (OrderModel order in orderController.orders)
                        Center(
                          child: Container(
                              padding: EdgeInsets.all(10.sp),
                              height: 176.h,
                              margin: EdgeInsets.only(bottom: 10.h),
                              width: Get.width - 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.r),
                                  topRight: Radius.circular(30.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/logo.png'),
                                            radius: 30.r,
                                            backgroundColor: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: Get.width - 120.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomText(
                                                      text: 'John Doe',
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '${order.distance} KM',
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.blueAccent,
                                                    size: 15.sp,
                                                  ),
                                                  CustomText(
                                                    text: '4.8',
                                                    fontSize: 15.sp,
                                                    color: Colors.blueAccent,
                                                  ),
                                                ],
                                              ),
                                              CustomText(
                                                text:
                                                    'Delivery Charge: PKR ${order.deliveryFees}',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomBtn(
                                        text: 'Accept',
                                        onPressed: () {
                                          orderController.acceptOrder(order);
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
