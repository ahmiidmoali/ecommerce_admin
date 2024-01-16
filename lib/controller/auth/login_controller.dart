import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/core/services/services.dart';
import 'package:delivery33/data/datasource/remote/auth/login_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class LogInController extends GetxController {
  logIn();
  goToSignup();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  late TextEditingController Email;
  late TextEditingController Password;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowedText = true;
  changeShowedText() {
    isShowedText = isShowedText == true ? false : true;
    update();
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  logIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.getData(Email.text, Password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          if (response["data"]["admins_approve"] == 1) {
            myServices.sharedPreferences
                .setString("id", "${response["data"]["admins_id"]}");
            String userid = myServices.sharedPreferences.getString("id")!;

            myServices.sharedPreferences
                .setString("username", "${response["data"]["admins_name"]}");
            myServices.sharedPreferences
                .setString("email", "${response["data"]["admins_email"]}");
            myServices.sharedPreferences
                .setString("phone", "${response["data"]["admins_phone"]}");
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("admins");
            FirebaseMessaging.instance.subscribeToTopic("admins$userid");
            myServices.sharedPreferences.setBool("isswitchprofile", true);
            Get.offNamed(AppRoute.homepage);
          } else {
            Get.offNamed(AppRoute.verifysignup,
                arguments: {"email": Email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Alert", middleText: "Email Or Password Is Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print("vaild");
    } else {
      print("not vaild");
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    Email = TextEditingController();
    Password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    Email.dispose();
    Password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}
