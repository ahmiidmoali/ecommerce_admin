import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/homepage_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ListCategories(
                I: index,
                categoriesmodel:
                    Categoriesmodel.fromJson(controller.categories[index]));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: controller.categories.length),
    );
  }
}

class ListCategories extends GetView<HomePageControllerImp> {
  final int I;
  final Categoriesmodel categoriesmodel;
  const ListCategories(
      {super.key, required this.categoriesmodel, required this.I});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, I, categoriesmodel.categoriesId.toString());
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            height: 70,
            width: 70,
          ),
          Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                height: 70,
                width: 70,
                child: SvgPicture.network(
                  "${AppLink.imagecategories}/${categoriesmodel.categoriesImage}",
                  color: Colors.black,
                ),
              ),
              Text(
                "${translateDataBase(categoriesmodel.categoriesName, categoriesmodel.categoriesNameAr)}",
                style: const TextStyle(fontSize: 17),
              )
            ],
          ),
        ],
      ),
    );
  }
}
