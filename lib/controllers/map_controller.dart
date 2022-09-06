import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MapController extends GetxController {
  Position? myLocation;
  getCurrentLocation() async {
    await Permission.location.request();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      myLocation = position;
      update();
    });
  }
}
