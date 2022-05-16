import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:localstore/localstore.dart';

import '../models/user_model.dart';
import '../views/authentication/otp_screen.dart';
import '../views/authentication/phone_auth_screen.dart';
import '../views/authentication/signup_screen.dart';
import '../views/home_screen.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = Localstore.instance;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');
  String? verificationIdRecieved;
  int? forceResendToken;
  UserModel userModel = UserModel();
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final updateNameFormKey = GlobalKey<FormState>();
  final updateEmailFormKey = GlobalKey<FormState>();

  registerWithPhoneCredentials() async {
    try {
      if (phoneController.text.isNotEmpty) {
        print(phoneController.text);
        await auth.verifyPhoneNumber(
          phoneNumber: phoneController.text,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
            if (auth.currentUser != null) {
              var data =
                  await _collectionReference.doc(auth.currentUser!.uid).get();
              if (data.exists) {
                userModel = UserModel.fromDocumentSnapshot(data);
                userModel.docId = auth.currentUser!.uid;
                await db
                    .collection('users')
                    .doc(userModel.docId)
                    .set(userModel.mapToLocalStorage());
                update();
                Get.offAll(() => HomeScreen());
              } else {
                Get.offAll(() => SignUpScreen());
              }
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.code);
            Get.snackbar('Error', e.toString(),
                backgroundColor: Colors.black, colorText: Colors.white);
          },
          timeout: Duration(seconds: 30),
          forceResendingToken: forceResendToken,
          codeSent: (String? verificationId, int? resendToken) {
            verificationIdRecieved = verificationId;
            forceResendToken = resendToken;
            Get.to(() => OtpScreen());
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("code auto retrieval timeout");
            verificationIdRecieved = verificationId;
          },
        );
      } else {
        Get.snackbar('Alert', 'Please Enter Number',
            backgroundColor: Colors.black, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', '${e.toString()}',
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  verifyPhoneNumber({required String otp}) async {
    try {
      if (otp.isNotEmpty) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationIdRecieved!, smsCode: otp);
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          var data =
              await _collectionReference.doc(userCredential.user!.uid).get();
          if (data.exists) {
            userModel = UserModel.fromDocumentSnapshot(data);
            userModel.docId = auth.currentUser!.uid;
            await db
                .collection('users')
                .doc(userModel.docId)
                .set(userModel.mapToLocalStorage());
            update();
            Get.offAll(() => HomeScreen());
          } else {
            Get.offAll(() => SignUpScreen());
          }
        }
      } else {
        Get.snackbar('Alert', 'Enter The Code',
            backgroundColor: Colors.black, colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code,
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  validateSignUpForm() {
    if (!signUpFormKey.currentState!.validate()) {
      return null;
    } else if (auth.currentUser != null) {
      userModel.firstName = firstNameController.text;
      userModel.lastName = lastNameController.text;
      userModel.email = emailController.text;
      userModel.phoneNumber = auth.currentUser!.phoneNumber;
      userModel.userType = 'rider';
      userModel.profilePic = '';
      addUser();
    }
  }

  addUser() async {
    if (auth.currentUser != null) {
      await _collectionReference
          .doc(auth.currentUser!.uid)
          .set(userModel.toMap())
          .then((value) async {
        //     var data =
        // await _collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).get();
        //             userModel = UserModel.fromDocumentSnapshot(data);
        userModel.docId = auth.currentUser!.uid;
        await db
            .collection('users')
            .doc(userModel.docId)
            .set(userModel.mapToLocalStorage());
        update();
        Get.snackbar('Success', 'User Added',
            backgroundColor: Colors.amber, colorText: Colors.white);
        Get.offAll(() => HomeScreen());
      });
    }
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    bool isLoggedIn = false;

    if (auth.currentUser != null) {
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) {
        if (value != null) {
          userModel = UserModel.fromLocalStore(value);
          userModel.docRef = _collectionReference.doc(userModel.docId);
          isLoggedIn = true;
        }
      });
      return isLoggedIn;
    }
    return isLoggedIn;
  }

  signOut() async {
    try {
      if (auth.currentUser != null) {
        userModel = UserModel();
        await db.collection('users').doc(auth.currentUser!.uid).delete();
        await auth.signOut();
        Get.offAll(() => PhoneAuthScreen());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  mapUserDataToControllers() {
    if (userModel != null && userModel.email != null) {
      firstNameController.text = userModel.firstName!;
      lastNameController.text = userModel.lastName!;
      emailController.text = userModel.email!;
      phoneController.text = userModel.phoneNumber!;
    }
  }

  validateNameForm() {
    if (!updateNameFormKey.currentState!.validate()) {
      return null;
    } else {
      if (firstNameController.text != userModel.firstName ||
          lastNameController.text != userModel.lastName) {
        userModel.firstName = firstNameController.text;
        userModel.lastName = lastNameController.text;
        updateUserData();
      }
    }
  }

  validateEmailForm() {
    if (!updateEmailFormKey.currentState!.validate()) {
      return null;
    } else {
      if (emailController.text != userModel.email) {
        userModel.email = emailController.text;
        updateUserData();
      }
    }
  }

  updateUserData() async {
    await _collectionReference
        .doc(auth.currentUser!.uid)
        .update(userModel.toMap())
        .then((value) {
      Get.snackbar('Success', 'Data Updated',
          backgroundColor: Colors.amberAccent, colorText: Colors.red);
    });
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(userModel.mapToLocalStorage());
    update();
  }
}
