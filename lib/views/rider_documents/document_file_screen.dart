import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';
import 'package:shapaa_rider/views/rider_documents/document_submit_screen.dart';
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
    authController.initializeCamera(authController.selectedCamera == 1 ? 0 : 0);
    super.initState();
  }

  @override
  void dispose() {
    authController.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return Stack(fit: StackFit.expand, children: [
          Container(
            // height: 350.h,
            // width: 350.h,
            child: FutureBuilder<void>(
              future: authController.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(authController.controller!);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          cameraOverlay(
              padding: 18, aspectRatio: 0.6, color: Color(0x55000022)),
          Positioned(
            bottom: 6,
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: InkWell(
                      onTap: () {
                        if (cameras.length > 1) {
                          authController.selectedCamera =
                              authController.selectedCamera == 0
                                  ? 1
                                  : 0; //Switch camera
                          authController.initializeCamera(
                              authController.selectedCamera == 1 ? 0 : 0);
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
                          color: bgCreamColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () async {
                        await authController.getImageFromInAppCamera();
                        if (authController.file != null) {
                          Get.to(() => DocumentSubmitPage());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: appOrengeColor, width: 3)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 60.h,
                            width: 60.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.grey,
                                    Colors.red,
                                  ],
                                ),
                                color: appOrengeColor,
                                borderRadius: BorderRadius.circular(40.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),

                  /*
                    InkWell(
                      onTap: () {

                        Get.dialog(customDialogBox(
                            title: "Upload Document",
                            description: "",
                            firstButtontitle: "Gallery",
                            firstOntab: () async {
                              Navigator.of(context).pop();
                              await authController.getImageFromGallery();
                              if (authController.file != null) {
                                Get.to(() => DriverDocumentSubmitPage());
                              }
                            },
                            firstIcon: Icons.collections,
                            seconButtontitle: "Drive",
                            secondOntab: () async {
                              Navigator.of(context).pop();
                              await authController.getFileFromDevice();
                              if (authController.file != null) {
                                Get.to(() => DriverDocumentSubmitPage());
                              }
                            },
                            secondIcon: Icons.camera_enhance_rounded));

                        // Get.bottomSheet(
                        //   Container(
                        //       height: 200.h,
                        //       decoration: BoxDecoration(
                        //           color: appDarkBlueColor,
                        //           borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(20),
                        //               topRight: Radius.circular(20))),
                        //       child: Column(
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.all(18.0),
                        //             child: customButton(
                        //                 onpress: () async {
                        //                   await driverController
                        //                       .getImageFromGallery();

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
                    ),
                     */
                ],
              ),
            ),
          ),
          // cameraOverlay(padding: 8, aspectRatio: 2.6, color: Color(0x55000022)),
        ]);
      }),
    );
  }
}

Widget cameraOverlay(
    {required double padding,
    required double aspectRatio,
    required Color color}) {
  return LayoutBuilder(builder: (context, constraints) {
    double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
    double horizontalPadding;
    double verticalPadding;

    if (parentAspectRatio < aspectRatio) {
      horizontalPadding = padding;
      verticalPadding = (constraints.maxHeight -
              ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
          2;
    } else {
      verticalPadding = padding;
      horizontalPadding = (constraints.maxWidth -
              ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
          2;
    }
    return Stack(fit: StackFit.expand, children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.centerRight,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: appOrengeColor)),
      )
    ]);
  });
}
