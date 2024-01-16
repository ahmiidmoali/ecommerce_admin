import 'dart:io';

import 'package:delivery33/linkapi.dart';

import '../../../core/class/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.catview, {});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addData(Map data, File? image, String namerequest) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.catadd, data, image, namerequest);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
