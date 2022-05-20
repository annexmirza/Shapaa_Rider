import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';

import 'dart:math' as math;

import '../../main.dart';

import '../../widgets/custom_text.dart';

class DocumentFileScreen extends StatefulWidget {
  @override
  State<DocumentFileScreen> createState() => _DocumentFileScreenState();
}

class _DocumentFileScreenState extends State<DocumentFileScreen> {
  // UserController userController = Get.put(UserController());
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState

    authController.initializeCamera(authController.selectedCamera!)
      ..then((void v) {});
  }

  @override
  void dispose() {
    authController.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return Stack(children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 10.h,
                  color: Colors.red,
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 10.0.w, top: 20.h),
                //   child: Align(
                //     alignment: Alignment.topLeft,
                //     child: customCircularButton(
                //         ontap: () {
                //           Get.back();
                //         },
                //         icons: Icons.arrow_back_rounded,
                //         color: Colors.grey[400]),
                //   ),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                // cameraOverlay(
                //     padding: 9, aspectRatio: 0.6, color: Color(0x55000022)),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Container(
                    height: 350.h,
                    width: 280.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: FutureBuilder<void>(
                      future: authController.initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If the Future is complete, display the preview.
                          return CameraPreview(
                            authController.controller!,
                          );
                        } else {
                          // Otherwise, display a loading indicator.
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    height: 30.h,
                    child: CustomText(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      text: 'Fit your face inside the guide',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Spacer(),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10.0.w, right: 10.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (cameras.length > 1) {
                            authController.selectedCamera =
                                authController.selectedCamera == 0
                                    ? 1
                                    : 0; //Switch camera
                            authController.initializeCamera(
                                authController.selectedCamera!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('No secondary camera found'),
                              duration: const Duration(seconds: 2),
                            ));
                          }
                        },
                        child: Container(
                          height: 60.h,
                          width: 60.h,
                          child: Icon(
                            Icons.switch_camera_rounded,
                            size: 35.r,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 80.w,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: InkWell(
                          onTap: () async {
                            await authController.getImageFromInAppCamera();
                            if (authController.file != null) {
                              // Get.to(() => ProfilePageSubmitPage());
                              print(
                                  " pssssssssssssssssssssssssssssssssssssssssssssss");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.red, width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 60.h,
                                width: 60.h,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.blue,
                                        Colors.red,
                                      ],
                                    ),
                                    // gradient: ,
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(40.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: InkWell(
                          // onTap: () {
                          //   Get.dialog(customDialogBox(
                          //       title: "Upload Profile Picture",
                          //       description: "",
                          //       firstButtontitle: "Gallery",
                          //       firstOntab: () async {
                          //         Navigator.of(context).pop();
                          //         await user.getImageFromGallery();

                          //         if (driverController.file != null) {
                          //           Get.to(() => DocumentPageSubmitPage());
                          //         }
                          //       },
                          //       firstIcon: Icons.collections,
                          //       seconButtontitle: "Browse File",
                          //       secondOntab: () async {
                          //         Navigator.of(context).pop();
                          //         await driverController.getImageFromDrive();
                          //         if (driverController.file != null) {
                          // //           Get.to(() => DocumentPageSubmitPage());
                          // //         }
                          //       },
                          //       secondIcon: Icons.camera_enhance_rounded));
                          // },
                          child: Container(
                            height: 60.h,
                            width: 60.h,
                            child: Icon(Icons.switch_camera_rounded,
                                size: 35.r, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // cameraOverlay(padding: 8, aspectRatio: 2.6, color: Color(0x55000022)),
        ]);
      }),
    );
  }
}
