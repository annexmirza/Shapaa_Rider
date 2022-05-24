import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

import 'document_model.dart';

class UserModel{

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  DocumentReference? docRef;
  String? docId;
  String? userType;
  String? profilePic;
  List<DocumentModel>? listOfDocuments;
  String? vehicleType;

    UserModel({this.email,this.lastName,this.firstName,this.docRef,this.phoneNumber,this.docId,this.userType,this.profilePic,this.listOfDocuments});

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc){
    return UserModel(
      docRef: doc.reference,
      email: doc['email'],
      firstName: doc['first_name'],
      lastName: doc['last_name'],
      phoneNumber: doc['phone_number'],
      userType: doc['user_type'],
      profilePic: doc['profile_pic'],
    );
  }

  factory UserModel.fromLocalStore(Map<String,dynamic> doc){
    return UserModel(
        docId: doc['id'],
        email: doc['email'],
        firstName: doc['first_name'],
        lastName: doc['last_name'],
        phoneNumber: doc['phone_number'],
        userType: doc['user_type'],
        profilePic: doc['profile_pic'],
    );
  }

  Map<String,dynamic> toMap() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'user_type': userType,
      'profile_pic': profilePic
    };
  }
    Map<String,dynamic> mapToLocalStorage() {
      return {
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'id' : docId,
        'user_type' : userType,
        'profile_pic': profilePic
      };
    }

}