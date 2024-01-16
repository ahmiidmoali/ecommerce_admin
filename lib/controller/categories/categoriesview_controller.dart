import 'dart:convert';

import 'package:delivery33/core/services/services.dart';
import 'package:delivery33/data/datasource/remote/categories_data.dart';
import 'package:delivery33/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class CategoriesViewController extends GetxController {}

class CategoriesViewControllerImp extends CategoriesViewController {
  List categories = [];

  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getShare() {}
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
