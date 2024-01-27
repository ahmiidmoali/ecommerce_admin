import 'package:delivery33/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orderscreen_controller.dart';

class ordersScreen extends StatelessWidget {
  const ordersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersScreenController controller = Get.put(OrdersScreenController());
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: AppColor.primaryColor),
          height: 50,
          child: Row(
            children: [
              ...List.generate(
                  controller.pages.length,
                  (index) => Expanded(
                          child: InkWell(
                        onTap: () {
                          controller.changepage(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(color: AppColor.black))),
                          alignment: Alignment.center,
                          child: Text(controller.pagesname[index]),
                        ),
                      )))
            ],
          ),
        ),
        body: GetBuilder<OrdersScreenController>(
          builder: (controller) =>
              controller.pages.elementAt(controller.current),
        ));
  }
}
