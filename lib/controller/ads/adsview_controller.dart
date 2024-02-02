import 'package:delivery33/data/datasource/remote/ads_data.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/class/statusrequest.dart';
import 'package:delivery33/core/functions/handlingdatacontroller.dart';
import 'package:delivery33/data/datasource/remote/test_data.dart';

class AdsViewController extends GetxController {
  List data = [];
  AdsData adsData = AdsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeData(String adsid, String oldpic) {
    adsData.deleteData({"adsid": adsid, "oldpic": oldpic});

    data.removeWhere((element) => element["ads_id"] == int.parse(adsid));
    Get.back();

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
