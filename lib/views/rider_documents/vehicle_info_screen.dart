import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';

import '../../widgets/custom_btn.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/custom_text.dart';

class VehicleInfoScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffBCBABA),
      body: SingleChildScrollView(child: GetBuilder<AuthController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 245.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: 205.h,
                        width: 347.w,
                      ),
                      // Center(child: Text('OTP',style: GoogleFonts.poppins(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),)),
                    ],
                  )),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: CustomText(
                  text: 'Vehicle Information',
                  fontSize: 25.sp,
                ),
              ),
              Form(
                key: authController.vehicleInfoFormKey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  child: Column(
                    children: [
                      DropdownSearch<String?>(
                        // mode: Mode.MENU,
                        // showSearchBox: true,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        items: authController.dropDownVehicles,
                        // dropdownSearchDecoration: const InputDecoration(
                        //   labelText: "---Please Select---",
                        //   hintText: "Vehicles",
                        // ),
                        onSaved: (value) {
                          authController.mapSelectedVehicle(value!);
                        },
                        //popupItemDisabled: (String s) => s.startsWith('C'),
                        onChanged: (value) {
                          authController.mapSelectedVehicle(value!);
                        },
                        //selectedItem: driverController.selectedItem,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        labelText: 'Registration Number',
                        hintText: 'Enter your Registration Number',
                        controller: authController.registrationController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        labelText: 'License Number',
                        hintText: 'Enter your License Number',
                        controller: authController.licenseController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomBtn(
                          text: 'Continue',
                          onPressed: () {
                            authController.validateVehicleForm();
                            //authController.validateSignUpForm();
                          }),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
