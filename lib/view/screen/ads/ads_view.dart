import 'package:delivery33/controller/ads/adsview_controller.dart';
import 'package:delivery33/core/class/handlingdataview.dart';
import 'package:delivery33/core/constant/imageasset.dart';
import 'package:delivery33/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class adsView extends StatelessWidget {
  const adsView({super.key});

  @override
  Widget build(BuildContext context) {
    AdsViewController controller = Get.put(AdsViewController());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<AdsViewController>(
            builder: (controller) => handlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            child: Card(
                                child: Column(
                              children: [
                                Row(children: [
                                  const Text(
                                    "itemsid: ",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.data[index]["ads_itemsid"]}",
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          content: const Text(
                                              "Delete this ad permanently"),
                                          onConfirm: () {
                                            controller.removeData(
                                                "${controller.data[index]["ads_id"]}",
                                                "${controller.data[index]["ads_image"]}");
                                          },
                                          onCancel: () {
                                            Get.back();
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                          Icons.delete_outline_outlined))
                                ]),
                                Container(
                                    child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imageads}/${controller.data[index]["ads_image"]}",
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                )),
                              ],
                            )),
                          ))
                ],
              ),
            ),
          )),
    );
  }
}
