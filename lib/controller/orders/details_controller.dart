import 'package:get/get.dart';
import 'package:delivery33/core/services/services.dart';
import 'package:delivery33/data/datasource/remote/orders/pending_data.dart';
import 'package:delivery33/data/model/addressmodel.dart';
import 'package:delivery33/data/model/itemscardmodel.dart';
import 'package:delivery33/data/model/ordersmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/orders/details_data.dart';

class OrderDetailsController extends GetxController {
  List<ItemsCardModel> dataitems = [];
  String? ordersid;
  String? usersid;
  int? addressid;

  bool myisprepared = false;
  // List<OrdersModel> dataorders = [];
  Map dataorders = {};
  confirmorder() {
    if (myisprepared == false) {
      myisprepared = true;
      update();
    } else {
      myisprepared = false;
      update();
    }
  }

  List<AddressModel> dataaddress = [];
  MyServices myServices = Get.find();
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  getData(String usersid, String ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetailsData.getData(usersid, ordersid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        dataaddress.clear();
        dataitems.clear();

        List myresponseitems = response["items"];
        // List myresponseorders = response["orders"];
        dataorders = response["orders"];

        if (response["address"] != null) {
          List myresponseaddress = response["address"];
          dataaddress
              .addAll(myresponseaddress.map((e) => AddressModel.fromJson(e)));
        }

        dataitems
            .addAll(myresponseitems.map((e) => ItemsCardModel.fromJson(e)));
        // dataorders.addAll(myresponseorders.map((e) => OrdersModel.fromJson(e)));

        addressid = dataorders["orders_address"];
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() async {
    ordersid = Get.arguments["myordersid"];
    usersid = Get.arguments["usersid"];
    await getData(usersid!, ordersid!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
