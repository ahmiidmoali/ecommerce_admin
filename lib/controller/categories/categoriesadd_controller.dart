import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/data/datasource/remote/categories_data.dart';
import 'package:delivery33/view/screen/categories_items/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import 'dart:io';

import '../../core/functions/uploadfile.dart';

abstract class CategoriesAddController extends GetxController {}

class CategoriesAddControllerImp extends CategoriesAddController {
  File? image;
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();

  chooseFile() async {
    image = await fileUploadGallery(true);
    update();
  }

  CategoriesData categoriesData = CategoriesData(Get.find());
  late TextEditingController catname;
  late TextEditingController catnamear;
  StatusRequest statusRequest = StatusRequest.none;
  getimage() {}

  addData() async {
    if (image == null) {
      return Get.snackbar("failed", "please choose the pic first");
    }
    if (formstate1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoriesData.addData(
          {"catname": catname.text, "catnamear": catnamear.text},
          image,
          "imagename");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoute.homepage);
        } else {
          // Get.defaultDialog(
          //     title: "Alert", middleText: "This Email Is Not Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    catname = TextEditingController();
    catnamear = TextEditingController();
    super.onInit();
  }
}
