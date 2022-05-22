import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/views/rider_documents/document_file_screen.dart';
import 'package:shapaa_rider/widgets/documnet_card.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/custom_text.dart';

class DocumentsScreen extends StatelessWidget {

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    authController.addDocumentsData();
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
              SizedBox(height: 10.h,),
              Center(
                child: CustomText(
                  text: 'Rider Documents',
                  fontSize: 25.sp,
                ),
              ),
              SizedBox(height: 10.h,),
              for(var document in authController.listOfDocuments)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 15.w),
                child: DocumentCard(
                  ontap: (){
                    authController.mapSelectedDocument(document);
                    Get.to(() => DocumentFilePage());
                  },
                  uploadingDoc: document
                      .docFile != null && document.docFile!.isEmpty
                      ? true
                      : false,
                  uploaded: document.docFile != null &&
                      document.docFile!.isNotEmpty
                      ? true
                      : false,
                  dateOnTap: (){},
                  titletext: document.docTitle,
                  subtext: '',
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 48.sp, vertical: 10.h),
                child: CustomBtn(
                    text: 'Continue',
                    onPressed: () {
                      authController.validateDocuments();
                    }),
              )
            ],
          );
        },
      )),
    );
  }
}
