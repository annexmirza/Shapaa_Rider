import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

import 'package:get/get.dart';

import 'authentication/phone_auth_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages, buttonColor: Colors.white,
        showBullets: true,
        inactiveBulletColor: Colors.white,
        // backgroundProvider: NetworkImage('https://picsum.photos/720/1280'),
        skipCallback: () {
          Get.offAll(() => PhoneAuthScreen());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          Get.offAll(() => PhoneAuthScreen());
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.red,
        imageAssetPath: 'assets/shapaa2Artboard.png',
        title: 'Shapaa',
        body: 'Browes the menu and order directly from the application',
        doAnimateImage: true),
    PageModel(
        color: Colors.amber,
        imageAssetPath: 'assets/shapaa3prefArtboard.png',
        title: 'Food Delivery',
        body:
            'We will deliver your order as quickly and efficiently as possible.',
        doAnimateImage: true),
    PageModel(
        color: Colors.blue,
        imageAssetPath: 'assets/shappaArtboard.png',
        title: 'Get your order',
        body: 'The courier will deliver your order directly to your home ',
        doAnimateImage: true),
    // PageModel.withChild(
    //     titleColor: Colors.amber,
    //     child: Padding(
    //       padding: EdgeInsets.only(bottom: 25.0),
    //       child:
    //           Image.asset('assets/logofood.png', width: 300.0, height: 300.0),
    //     ),
    //     color: btnColor,
    //     doAnimateChild: true)
  ];
}
