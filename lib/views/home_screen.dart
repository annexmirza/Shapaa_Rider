import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';
import 'package:shapaa_rider/controllers/map_controller.dart';
import 'package:shapaa_rider/controllers/order_controller.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:shapaa_rider/views/my_deliveries.dart';
import 'package:shapaa_rider/views/my_earning_screen.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';
import 'package:shapaa_rider/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  OrderController orderController = Get.put(OrderController());
  MapController mapController = Get.put(MapController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    orderController.getNewOrders();
    mapController.getCurrentLocation();
    // orderController.duplicate();
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: appOrengeColor.withOpacity(0.3),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        image: authController.userModel.profilePic != null
                            ? DecorationImage(
                                image: NetworkImage(
                                    authController.userModel.profilePic!),
                                fit: BoxFit.cover)
                            : const DecorationImage(
                                image: AssetImage('assets/resturantpic.png'),
                                fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          CustomText(text: authController.userModel.firstName!),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: appOrengeColor,
                                size: 20.r,
                              ),
                              Icon(
                                Icons.star,
                                color: appOrengeColor,
                                size: 20.r,
                              ),
                              Icon(
                                Icons.star,
                                color: appOrengeColor,
                                size: 20.r,
                              ),
                              Icon(
                                Icons.star,
                                color: appOrengeColor,
                                size: 20.r,
                              ),
                              Icon(
                                Icons.star,
                                color: appOrengeColor,
                                size: 20.r,
                              ),
                            ],
                          ),
                          CustomText(
                              text: authController.userModel.vehicleType
                                  .toString())
                        ],
                      ),
                    )
                  ],
                )

                //  Text('sadhksaj'),
                ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => InboxScreen());
                // Get.to(MyBookingScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(left: 18.0.h, bottom: 5.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.forward_to_inbox_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'Inbox',
                      style: GoogleFonts.comicNeue(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    // Text(
                    //   'My Dlivers',
                    //   style: GoogleFonts.comicNeue(
                    //     color: Colors.black,
                    //     fontSize: 15.sp,
                    //   ),
                    // ),
                    // Text(
                    //   'My Earnning',
                    //   style: GoogleFonts.comicNeue(
                    //     color: Colors.black,
                    //     fontSize: 15.sp,
                    //   ),
                    // ),
                    // Text(
                    //   'vehicle  Docoments',
                    //   style: GoogleFonts.comicNeue(
                    //     color: Colors.black,
                    //     fontSize: 15.sp,
                    //   ),
                    // ),
                    // Text(
                    //   'Personal Docoments',
                    //   style: GoogleFonts.comicNeue(
                    //     color: Colors.black,
                    //     fontSize: 15.sp,
                    //   ),
                    // ),
                    // Text(
                    //   'Inbox',
                    //   style: GoogleFonts.comicNeue(
                    //     color: Colors.black,
                    //     fontSize: 15.sp,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => MyDeliveries());
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 18.0.h, bottom: 5.h),
                    child: Row(children: [
                      Icon(
                        Icons.delivery_dining_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'My Delivers',
                        style: GoogleFonts.comicNeue(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ]))),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => MyEarningsScreen());
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 18.0.h, bottom: 5.h),
                    child: Row(children: [
                      Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'My Earnings',
                        style: GoogleFonts.comicNeue(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ]))),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                onTap: () {
                  // Get.to(() => InboxScreen());
                  // Get.to(MyBookingScreen());
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 18.0.h, bottom: 5.h),
                    child: Row(children: [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Personal Documents',
                        style: GoogleFonts.comicNeue(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ]))),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                onTap: () {
                  // Get.to(() => InboxScreen());
                  // Get.to(MyBookingScreen());
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 18.0.h, bottom: 5.h),
                    child: Row(children: [
                      Icon(
                        Icons.document_scanner_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Vehical Documents',
                        style: GoogleFonts.comicNeue(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ]))),
          ],
        )),
        appBar: AppBar(
          backgroundColor: appOrengeColor.withOpacity(0.1),
          leading: InkWell(
            onTap: () => _scaffoldKey.currentState!.openDrawer(),
            child: Icon(
              Icons.menu,
              color: appOrengeColor,
            ),
          ),
          actions: [
            Center(
              child: GetBuilder<MapController>(builder: (mapController) {
                return Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: mapController.isOnline
                          ? Colors.blueAccent
                          : appOrengeColor),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        mapController.isOnlineFunction();
                      },
                      child: CustomText(
                        text: mapController.isOnline == true
                            ? 'Online'
                            : "offline",
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   backgroundImage: AssetImage('assets/logo.png'),
              //   radius: 20.r,
              // ),
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
                              height: 190.h,
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
                                            width: 250.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: 'John Doe',
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                CustomText(
                                                  text: '${order.distance} KM',
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
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
                                  Container(
                                    height: 36.h,
                                    width: 200.w,
                                    child: CustomBtn(
                                      text: 'Accept',
                                      onPressed: () {
                                        orderController.acceptOrder(order);
                                      },
                                    ),
                                    color: appOrengeColor,
                                  ),
                                  SizedBox(
                                    height: 20.h,
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
