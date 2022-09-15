import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrderModel {
  String? orderItems;
  String? customerContact;
  String? orderStatus;
  double? deliveryFees;
  double? subTotal;
  double? total;
  DocumentReference? userRef;
  DocumentReference? shopRef;
  Map<String, dynamic>? pickUpLocation;
  Map<String, dynamic>? dropOffLocation;
  DocumentReference? docRef;
  double? distance;
  int? date;
  String? orderDate;
  OrderModel(
      {this.deliveryFees,
      this.orderItems,
      this.pickUpLocation,
      this.dropOffLocation,
      this.shopRef,
      this.subTotal,
      this.total,
      this.userRef,
      this.docRef,
      this.customerContact,
      this.orderStatus,
      this.distance,
      this.date,
      this.orderDate});

  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return OrderModel(
      docRef: doc.reference,
      orderItems: doc['order_items'],
      pickUpLocation: doc['pickup_location'],
      dropOffLocation: doc['dropoff_location'],
      shopRef: doc['shop_ref'],
      userRef: doc['user_ref'],
      deliveryFees: doc['delivery_fees'].toDouble() ?? 0.00,
      subTotal: doc['sub_total'].toDouble() ?? 0.00,
      total: doc['total'].toDouble() ?? 0.00,
      customerContact: doc['customer_contact'],
      orderStatus: doc['order_status'],
      date: doc['date'],
      orderDate: doc['date'] != null
          ? DateFormat("yyyy-MM-dd")
              .format(DateTime.fromMillisecondsSinceEpoch(doc['date']))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order_items': orderItems ?? '',
      'pickup_location': pickUpLocation,
      'dropoff_location': dropOffLocation,
      'delivery_fees': deliveryFees ?? 0.00,
      'sub_total': subTotal ?? 0.00,
      'total': total ?? 0.00,
      'customer_contact': customerContact ?? '',
      'order_status': orderStatus ?? "Pending",
      'shop_ref': shopRef,
      'user_ref': userRef,
    };
  }
}

class LocationModel {
  double? lat;
  double? lng;
  LocationModel({this.lat, this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
  Map<String, dynamic> toMap() => {
        'lat': lat ?? 0.00,
        'lng': lng ?? 0.00,
      };
}
