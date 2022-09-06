

import 'package:cloud_firestore/cloud_firestore.dart';

import 'document_model.dart';

class VehicleModel{

  String? vehicleType;
  String? registrationNumber;
  String? licenseNumber;
  List<DocumentModel>? listOfDocuments;

  VehicleModel({this.vehicleType, this.registrationNumber, this.licenseNumber,
      this.listOfDocuments});
  factory VehicleModel.fromDocumentSnapShot(DocumentSnapshot doc){
    return VehicleModel(
        vehicleType: doc['vehicle_type'] ?? '',
        registrationNumber: doc['registration_number'] ?? '',
        licenseNumber: doc['license_number'] ?? '',
        listOfDocuments: List<DocumentModel>.from(doc['documents'].map((x) => DocumentModel.fromDocumentSnapShot(x))),
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'vehicle_type': vehicleType ?? '',
      'registration_number': registrationNumber ?? '',
      'license_number': licenseNumber ?? '',
      'documents': listOfDocuments != null ? List<dynamic>.from(listOfDocuments!.map((x) => x.toJson())) : [],
    };
  }
}