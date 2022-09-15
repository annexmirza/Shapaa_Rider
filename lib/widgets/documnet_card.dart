import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shapaa_rider/constands.dart';
import 'custom_text.dart';

class DocumentCard extends StatelessWidget {
  String? titletext;
  String? requried;
  var ontap;
  String? subtext;
  String? showDate;
  var dateOnTap;
  var onViewTap;
  String? docName;
  bool? uploadingDoc, uploaded, isDateVisible,isViewVisible;
  DocumentCard(
      {this.titletext,
      this.showDate,
      this.subtext,
      required this.ontap,
      this.requried,
      required this.dateOnTap,
      this.docName,
      required this.onViewTap,
      this.isViewVisible = false,
      this.isDateVisible,
      this.uploadingDoc,
      this.uploaded});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.h,
      decoration: BoxDecoration(
          color: uploaded != null && uploaded!
              ? Colors.black45
              : uploadingDoc != null && uploadingDoc!
                  ? Colors.blue
                  : Colors.white70,
          border: Border.all(color: appGreyColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              if(isViewVisible!)
              Align(
                  alignment: Alignment.topRight,
                  child:
                      InkWell(
                          onTap: onViewTap,
                          child: CustomText(text: "View"))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      titletext ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                    child: Text(
                      requried ?? '',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 0.h,
              ),
              Container(
                child: Text(
                  subtext ?? '',
                  maxLines: 25,
                  style: TextStyle(
                    fontSize: 12.h,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              //
              // if (isDateVisible != null && isDateVisible!)
              //   Column(
              //     children: [
              //       Align(
              //         alignment: Alignment.topLeft,
              //         child: CustomText(
              //           titletext: " Expires",
              //           fontWeight: FontWeight.bold,
              //           fontsize: 10.sp,
              //         ),
              //       ),
              //       SizedBox(
              //         height: 5.h,
              //       ),
              //       Align(
              //         alignment: Alignment.topLeft,
              //         child: Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(width: 1),
              //                 borderRadius:
              //                 BorderRadius.all(Radius.circular(5))),
              //             width: 200.w,
              //             child: InkWell(
              //                 onTap: dateOnTap,
              //                 child: Center(
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(5.0),
              //                       child: Row(
              //                         children: [
              //                           Text(
              //                             showDate ?? '',
              //                             style: TextStyle(fontSize: 15.sp),
              //                           ),
              //                           Spacer(),
              //                           Icon(Icons.arrow_drop_down)
              //                         ],
              //                       ),
              //                     )))),
              //       ),
              //     ],
              //   ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: uploaded != null && uploaded!
                        ? Row(
                            children: const [
                              Text("Uploaded"),
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ],
                          )
                        : uploadingDoc != null && uploadingDoc!
                            ? Row(
                                children: const [
                                  Text("Uploading"),
                                  Icon(
                                    Icons.file_upload_rounded,
                                    color: Colors.black,
                                  )
                                ],
                              )
                            : Text(''),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: ontap,
                      child: Container(
                        height: 45.h,
                        width: 120.w,
                        decoration: const BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            CustomText(
                              text: uploaded != null && uploaded!
                                  ? "Re-Upload"
                                  : "upload file ",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
