import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shapaa_rider/views/my_earning_screen.dart';

import 'package:shapaa_rider/views/on_bording_screen.dart';
import 'package:shapaa_rider/views/profile_screen.dart';
import 'package:shapaa_rider/views/rider_documents/documents_screen.dart';
import 'package:shapaa_rider/views/splash_screen/splash_screen.dart';

import 'controllers/auth_controller.dart';
import 'views/home_screen.dart';

var cameras;
bool shouldUseFirebaseEmulator = false; // before main()

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform
      );
  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();

  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,

              builder: EasyLoading.init(),

              //  builder: EasyLoading.init(),
              home: landingPage(),

              //  builder: EasyLoading.init(),
              // home: OnBoardingScreen(),
            ));
  }
}

Widget landingPage() {
  final authController = Get.put(AuthController(), permanent: true);
  return GetBuilder<AuthController>(builder: (controller) {
    return FutureBuilder(
      future: authController.checkIfUserIsLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return snapshot.data!;
        } else if (snapshot.hasData == false && snapshot.data == null) {
          return SplashScreen();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  });
}
