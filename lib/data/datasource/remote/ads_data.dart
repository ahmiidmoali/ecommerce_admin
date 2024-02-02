import 'package:delivery33/linkapi.dart';
import 'dart:io';

import '../../../core/class/crud.dart';

class AdsData {
  Crud crud;
  AdsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.adsview, {});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addData(Map data, File? image, String namerequest) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.adsadd, data, image, namerequest);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  editData(Map data, File? image, String namerequest) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.adsedit, data, image, namerequest);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteData(
    Map data,
  ) async {
    var response = await crud.postData(AppLink.adsdelete, data);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
