import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingService {
  start() {
    isLoadingActive.value = true;
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
    EasyLoading.instance.toastPosition = EasyLoadingToastPosition.center;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.maskType = EasyLoadingMaskType.none;
    EasyLoading.instance.indicatorColor = Colors.blue;
    EasyLoading.instance.backgroundColor = Colors.transparent;
    EasyLoading.instance.textColor = Colors.white.withOpacity(0);
    EasyLoading.instance.indicatorSize = 85.r;
    EasyLoading.instance.boxShadow = [
      const BoxShadow(
        color: Colors.transparent,
      ),
    ];
    EasyLoading.instance.maskColor = Colors.transparent;

    EasyLoading.show(
      dismissOnTap: false,
    );
  }

  stop() {
    isLoadingActive.value = false;
    EasyLoading.dismiss();
  }

  static RxBool isLoadingActive = false.obs;
}
