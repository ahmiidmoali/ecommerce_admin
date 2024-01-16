import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:delivery33/core/services/services.dart';

class ProfilePageController extends GetxController {
  MyServices myServices = Get.find();

  late bool isswitch;

  getisswitch() {
    if (myServices.sharedPreferences.getBool("isswitchprofile") == true) {
      isswitch = true;
    } else {
      isswitch = false;
    }
  }

  updateswitch(val) {
    isswitch = val;
    myServices.sharedPreferences.setBool("isswitchprofile", val);
    if (val == false) {
      String userid = myServices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("admins");

      FirebaseMessaging.instance.unsubscribeFromTopic("admins$userid");
    } else {
      String userid = myServices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.subscribeToTopic("admins");

      FirebaseMessaging.instance.subscribeToTopic("admins$userid");
    }

    update();
  }

  logOut() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("admins");
    FirebaseMessaging.instance.unsubscribeFromTopic("admins$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed("/");
  }

  @override
  void onInit() {
    getisswitch();
    super.onInit();
  }
}
