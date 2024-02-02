import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery33/controller/categories/categoriesview_controller.dart';
import 'package:delivery33/core/class/handlingdataview.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/constant/imageasset.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/linkapi.dart';
import 'package:delivery33/view/screen/categories_items/categories_add.dart';
import 'package:delivery33/view/screen/categories_items/items/items_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/categories/items/itemsview_controller.dart';

class itemsView extends StatelessWidget {
  const itemsView({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsViewController controller = Get.put(ItemsViewController());
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        color: AppColor.primaryColor,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.itemsadd,
                arguments: {"currentcat": controller.currentid});
          },
          child: const Icon(
            Icons.add,
            color: AppColor.white,
            size: 35,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<ItemsViewController>(
            builder: (controller) => handlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const Text(
                    "categories",
                    style: TextStyle(fontSize: 30),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .8),
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Stack(
                        children: [
                          Container(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 5, top: 20, right: 5, left: 5),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLink.imageitems}/${controller.items[index].itemsImage}",
                                    height: 100,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  )),
                              Text(
                                "${controller.items[index].itemsName}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Price",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${controller.items[index].itemsPrice}",
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          )),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.adsadd, arguments: {
                                    "currentid": controller.items[index].itemsId
                                        .toString()
                                  });
                                },
                                child: const Icon(
                                  Icons.ads_click,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                ),
                              )),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.itemsedit, arguments: {
                                    "currentitdata": controller.items[index]
                                  });
                                },
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                ),
                              )),
                          Positioned(
                              top: 60,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    content:
                                        Text("Delete this product permanently"),
                                    onConfirm: () {
                                      controller.removeData(
                                          controller.items[index].itemsId
                                              .toString(),
                                          controller.items[index].itemsImage
                                              .toString());
                                    },
                                    onCancel: () {
                                      Get.back();
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete_forever_outlined,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
