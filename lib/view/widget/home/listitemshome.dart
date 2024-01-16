import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery33/controller/homepage_controller.dart';
import 'package:delivery33/data/model/itemsmodel.dart';
import 'package:delivery33/data/model/topsellingmodel.dart';

import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: controller.topselling.length,
          itemBuilder: (context, index) {
            return ListItems(
              topSellingModel: controller.topselling[index],
              itemsmodel: controller.topselling2[index],
            );
          },
        ),
      ],
    );
  }
}

class ListItems extends GetView<HomePageControllerImp> {
  final TopSellingModel topSellingModel;
  final Itemsmodel itemsmodel;
  const ListItems(
      {super.key, required this.topSellingModel, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsmodel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 155,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(.3)),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Image.network(
              "${AppLink.imageitems}/${topSellingModel.itemsImage}",
              alignment: Alignment.center,
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              left: 15,
              top: 10,
              child: Text(
                "${translateDataBase(topSellingModel.itemsName, topSellingModel.itemsNameAr)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
