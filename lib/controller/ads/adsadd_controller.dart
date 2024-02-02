import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/data/datasource/remote/ads_data.dart';
import 'package:delivery33/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import 'dart:io';

import '../../../core/functions/uploadfile.dart';

abstract class AdsAddController extends GetxController {}

class AdsAddControllerImp extends AdsAddController {
  late String catid;
  int adstype = 1;
  String? adstypefinnal;
  change(int a, b) {
    if (adstype == a) {
      adstype = b;
      update();
    }
  }

  AdsData adsData = Get.put(AdsData(Get.find()));

  File? image;
  GlobalKey<FormState> formstate2 = GlobalKey<FormState>();

  chooseCamera() async {
    image = await imageUploadCamera();
    update();
  }

  chooseGallery() async {
    image = await fileUploadGallery(false);

    update();
  }

  late TextEditingController adscontent;
  StatusRequest statusRequest = StatusRequest.none;
  getimage() {}

  addData() async {
    if (image == null) {
      return Get.snackbar("failed", "please choose the pic first");
    }
    if (adstype == 0) {
      adstypefinnal = adstype.toString();
    } else {
      adstypefinnal = "null";
    }

    if (formstate2.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await adsData.addData({
        "adsitemsid": catid.toString(),
        "adstype": adstypefinnal,
        "adscontent": adscontent.text,
      }, image, "imagename");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoute.homepage);
          // Get.toNamed(AppRoute.itemsview,
          //     arguments: {"catid": catid.toString()});
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
    adscontent = TextEditingController();
    catid = Get.arguments["currentid"];
    super.onInit();
  }
}
