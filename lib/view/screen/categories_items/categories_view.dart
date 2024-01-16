import 'package:delivery33/controller/categories/categoriesview_controller.dart';
import 'package:delivery33/core/class/handlingdataview.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/constant/imageasset.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/linkapi.dart';
import 'package:delivery33/view/screen/categories_items/categories_add.dart';
import 'package:delivery33/view/screen/categories_items/items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class categoriesView extends StatelessWidget {
  const categoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewControllerImp());
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        color: AppColor.primaryColor,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.catadd);
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
          child: GetBuilder<CategoriesViewControllerImp>(
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
                    itemCount: controller.categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: .92),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.itemsview, arguments: {
                          "catid":
                              "${controller.categories[index]["categories_id"]}"
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 5, top: 5, right: 5, left: 5),
                                child: SvgPicture.network(
                                  "${AppLink.imagecategories}/${controller.categories[index]["categories_image"]}",
                                  height: 80,
                                  width: 60,
                                ),
                              ),
                              Text(
                                "${controller.categories[index]["categories_name"]}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
