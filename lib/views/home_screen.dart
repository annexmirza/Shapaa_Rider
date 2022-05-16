import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       height: Get.height,
       child: GoogleMap(
         initialCameraPosition: CameraPosition(
           target: LatLng(0, 0),
           zoom: 1,
         ),
      ),
    ));
  }
}
