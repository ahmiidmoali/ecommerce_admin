import 'package:delivery33/linkapi.dart';
import 'dart:io';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.itemsview, {"id": id});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addData(Map data, File? image, String namerequest) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.itemsadd, data, image, namerequest);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  editData(Map data, File? image, String namerequest) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.itemsedit, data, image, namerequest);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteData(
    Map data,
  ) async {
    var response = await crud.postData(AppLink.itemsdelete, data);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
