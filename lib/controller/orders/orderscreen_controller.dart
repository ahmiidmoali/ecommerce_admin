import 'package:delivery33/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreenController extends GetxController {
  int current = 0;
  changepage(i) {
    current = i;
    update();
  }

  List<Widget> pages = [
    pendingorders(),
    Center(
      child: Text("visca barca"),
    )
  ];
  List<String> pagesname = ["Pending", "nothing"];
}
