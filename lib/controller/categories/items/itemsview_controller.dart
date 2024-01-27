import 'package:delivery33/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/class/statusrequest.dart';
import 'package:delivery33/core/functions/handlingdatacontroller.dart';
import 'package:delivery33/data/datasource/remote/test_data.dart';

import '../../../data/datasource/remote/items_data.dart';

class ItemsViewController extends GetxController {
  List<Itemsmodel> items = [];
  late String currentid;

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  getData(id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        items.addAll(responsebody.map((e) => Itemsmodel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeData(String itid, String oldpic) {
    itemsData.deleteData({"itid": itid, "oldpic": oldpic});

    items.removeWhere((element) => element.itemsId == int.parse(itid));
    Get.back();

    update();
  }

  @override
  void onInit() {
    currentid = Get.arguments["catid"];
    getData(currentid);
    super.onInit();
  }
}
