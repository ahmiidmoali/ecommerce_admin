import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import 'dart:io';

import '../../../core/functions/uploadfile.dart';

abstract class ItemsAddController extends GetxController {}

class ItemsAddControllerImp extends ItemsAddController {
  late String catid;
  int activeState = 1;
  change(int a, b) {
    if (activeState == a) {
      activeState = b;
      update();
    }
  }

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

  ItemsData itemsData = ItemsData(Get.find());
  late TextEditingController itname;
  late TextEditingController itnamear;
  late TextEditingController itdesc;
  late TextEditingController itdescar;
  late TextEditingController itcount;
  late TextEditingController itprice;
  late TextEditingController itdiscount;
  StatusRequest statusRequest = StatusRequest.none;
  getimage() {}

  addData() async {
    if (image == null) {
      return Get.snackbar("failed", "please choose the pic first");
    }
    if (formstate2.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsData.addData({
        "itname": itname.text,
        "itnamear": itnamear.text,
        "itdesc": itdesc.text,
        "itdescar": itdescar.text,
        "itcount": itcount.text,
        "itactive": activeState.toString(),
        "itprice": itprice.text,
        "itdiscount": itdiscount.text,
        "itcategories": catid.toString()
      }, image, "imagename");
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
    itname = TextEditingController();
    itnamear = TextEditingController();
    itdesc = TextEditingController();
    itdescar = TextEditingController();
    itcount = TextEditingController();
    itprice = TextEditingController();
    itdiscount = TextEditingController();
    catid = Get.arguments["currentcat"];
    super.onInit();
  }
}
