import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];
  getNewOrders() async {
    FirebaseFirestore.instance
        .collection('orders')
        .where('order_status', isEqualTo: 'Pending')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      orders.clear();
      snapshot.docs.forEach((doc) {
        OrderModel order = OrderModel.fromDocumentSnapshot(doc);
        order.distance = Geolocator.distanceBetween(
                order.pickUpLocation!.latitude,
                order.pickUpLocation!.longitude,
                order.dropOffLocation!.latitude,
                order.dropOffLocation!.longitude) /
            1000;
        order.distance = double.parse(order.distance!.toStringAsFixed(2));
        orders.add(order);
      });
      update();
    });
  }

  duplicate() {
    FirebaseFirestore.instance.collection('orders').add(orders[0].toMap());
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  acceptOrder(OrderModel order) async {
    await order.docRef!.update({
      'order_status': 'Accepted',
    });
    openMap(order.pickUpLocation!.latitude, order.pickUpLocation!.longitude);
  }
}
