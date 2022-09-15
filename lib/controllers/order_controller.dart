import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shapaa_rider/controllers/auth_controller.dart';
import 'package:shapaa_rider/models/earning_model.dart';
import 'package:shapaa_rider/models/order_model.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderController extends GetxController {
  AuthController authController = Get.find();
  int index = 0;
  int totalDeliveries = 0;
  String currentDate = '';
  List<OrderModel> orders = [];
  List<OrderModel> myOrders = [];
  OrderModel? currentOrder;
  List<EarningModel> earnings = [];
  double totalEarning = 0.0;
  getNewOrders() async {
    FirebaseFirestore.instance
        .collection('orders')
        .where('order_status', isEqualTo: 'pending')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      orders.clear();
      snapshot.docs.forEach((doc) {
        OrderModel order = OrderModel.fromDocumentSnapshot(doc);
        order.distance = Geolocator.distanceBetween(
                order.pickUpLocation!['lat'],
                order.pickUpLocation!['lng'],
                order.dropOffLocation!['lat'],
                order.dropOffLocation!['lng']) /
            1000;
        order.distance = double.parse(order.distance!.toStringAsFixed(2));
        orders.add(order);
      });
      update();
    });
  }

  getCurrentOrder() {
    FirebaseFirestore.instance
        .collection('orders')
        .where('order_status', isNotEqualTo: 'delivered')
        .where('rider_ref', isEqualTo: authController.userModel.docRef)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      currentOrder = null;
      if (snapshot.docs.isNotEmpty) {
        OrderModel order = OrderModel.fromDocumentSnapshot(snapshot.docs[0]);
        order.distance = Geolocator.distanceBetween(
                order.pickUpLocation!['lat'],
                order.pickUpLocation!['lng'],
                order.dropOffLocation!['lat'],
                order.dropOffLocation!['lng']) /
            1000;
        order.distance = double.parse(order.distance!.toStringAsFixed(2));
        currentOrder = order;
      }
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
      'order_status': 'accepted',
      'rider_ref': authController.userModel.docRef,
    });
    openMap(order.pickUpLocation!['lat'], order.pickUpLocation!['lng']);
  }

  pickOrder(OrderModel order) async {
    await order.docRef!.update({
      'order_status': 'picked',
    });

    openMap(order.dropOffLocation!['lat'], order.dropOffLocation!['lng']);
  }

  deliverOrder(OrderModel order) async {
    await order.docRef!.update({
      'order_status': 'delivered',
    });
  }

  getMyORders() {
    FirebaseFirestore.instance
        .collection('orders')
        .where('rider_ref', isEqualTo: authController.userModel.docRef)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      myOrders.clear();
      earnings.clear();
      totalEarning = 0.0;
      earnings.clear();
      index = 0;
      snapshot.docs.forEach((doc) {
        OrderModel order = OrderModel.fromDocumentSnapshot(doc);
        order.distance = Geolocator.distanceBetween(
                order.pickUpLocation!['lat'],
                order.pickUpLocation!['lng'],
                order.dropOffLocation!['lat'],
                order.dropOffLocation!['lng']) /
            1000;
        if (order.orderDate != currentDate) {
          currentDate = order.orderDate!;
          totalDeliveries = 1;
          EarningModel earning = EarningModel(
            date: order.orderDate,
            earning: order.deliveryFees,
            totalDeliveries: totalDeliveries,
          );
          earnings.add(earning);
          index++;
        } else if (order.orderDate == currentDate) {
          totalDeliveries++;
          earnings[index - 1].earning =
              earnings[index - 1].earning! + order.deliveryFees!;
          earnings[index - 1].totalDeliveries = totalDeliveries;
          update();
        }

        totalEarning += order.deliveryFees!;
        order.distance = double.parse(order.distance!.toStringAsFixed(2));
        myOrders.add(order);
      });
      update();
    });
  }
}
