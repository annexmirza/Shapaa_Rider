import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/constands.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';
import 'package:shapaa_rider/widgets/custom_btn.dart';

import '../../widgets/custom_text.dart';

class DocumentSubmitPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<AuthController>(
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    height: 10.h,
                    color: appOrengeColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        color: Colors.grey[400],
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                    ),
                  ),

                  Container(
                    height: 400.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 3,
                      color: appOrengeColor,
                    )),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      child: Center(
                        child: authController.file != null
                            ? Image.file(
                                authController.file!,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                      ),
                    ),
                  ),

                  // Container(
                  //   height: 330.h,
                  //   width: 330.w,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       // borderRadius: BorderRadius.circular(150),
                  //       color: Colors.red),
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(150),
                  //       child: AspectRatio(
                  //           aspectRatio: 1,
                  //           child: Image.file(controller.file)),),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 30.h,
                    child: CustomText(
                      color: appGreyColor,
                      text: "Want to use this Photo?",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: CustomBtn(
                            text: 'Submit',
                            onPressed: () async {
                              authController.uploadFileToFirebaseStorage();
                            })),
                  ),
                ],
              );
            },
          )),
    );
  }
}
