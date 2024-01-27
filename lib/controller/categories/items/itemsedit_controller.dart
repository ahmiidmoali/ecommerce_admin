import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import 'dart:io';

import '../../../core/functions/uploadfile.dart';
import '../../../data/model/itemsmodel.dart';

abstract class ItemsEditController extends GetxController {}

class ItemsEditControllerImp extends ItemsEditController {
  List<Itemsmodel> items = [];
  late String itid;
  late int activeState;
  late String oldpic;

  late String iswithpic;
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

  editData() async {
    if (image == null) {
      iswithpic = "no";
    }
    if (image != null) {
      iswithpic = "yes";
    }

    if (formstate2.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsData.editData({
        "itname": itname.text,
        "itnamear": itnamear.text,
        "itdesc": itdesc.text,
        "itdescar": itdescar.text,
        "itcount": itcount.text,
        "itactive": activeState.toString(),
        "itprice": itprice.text,
        "itdiscount": itdiscount.text,
        "iswithpic": iswithpic,
        "oldpic": oldpic,
        "itid": itid.toString()
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
    items.clear();
    items.add(Get.arguments["currentitdata"]);
    itname = TextEditingController(text: items[0].itemsName.toString());
    itnamear = TextEditingController(text: items[0].itemsNameAr.toString());
    itdesc = TextEditingController(text: items[0].itemsDesc.toString());
    itdescar = TextEditingController(text: items[0].itemsDescAr.toString());
    itcount = TextEditingController(text: items[0].itemsCount.toString());
    itprice = TextEditingController(text: items[0].itemsPrice.toString());
    itdiscount = TextEditingController(text: items[0].itemsDiscount.toString());
    itid = items[0].itemsId.toString();
    oldpic = items[0].itemsImage.toString();
    activeState = items[0].itemsActive!;
    super.onInit();
  }
}
