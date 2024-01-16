import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/view/screen/homepage.dart';
import 'package:delivery33/view/screen/notifications_page.dart';

import 'package:delivery33/view/screen/profile.dart';

import '../view/screen/homepage_admin.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int current = 0;
  @override
  changePage(i) {
    current = i;
    update();
  }

  List<Widget> mypages = [
    const homePage(),
    homePageAdmin(),
    const notificationsPage(),
    const profilePage(),
  ];
  List<String> appbarname = ["home", "HomeAdmin", "notifica", "Settings"];
  List iconsList = [
    Icons.home_outlined,
    Icons.category_outlined,
    Icons.notifications_active_outlined,
    Icons.settings_outlined,
  ];
  exetfromapp() {
    Get.defaultDialog(
      title: "Do you want to",
      titlePadding: EdgeInsets.only(top: 5, bottom: 0),
      contentPadding: EdgeInsets.only(top: 4, bottom: 5),
      middleText: "Exit from the App",
      buttonColor: AppColor.primaryColor,
      middleTextStyle: TextStyle(fontSize: 25),
      confirmTextColor: AppColor.white,
      cancelTextColor: AppColor.primaryColor,
      onConfirm: () {
        exit(0);
      },
      onCancel: () {},
    );
    return Future.value(false);
  }
}
