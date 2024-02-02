import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/constant/imageasset.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/view/screen/categories_items/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePageAdmin extends StatelessWidget {
  const homePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            children: [
              CustomFieldHomePageAdmin(
                  onTap: () {
                    Get.to(() => const categoriesView());
                  },
                  imagename: AppImageAsset.cat1,
                  fieldname: "Categories"),
              CustomFieldHomePageAdmin(
                  onTap: () {
                    Get.toNamed(AppRoute.orderscreen);
                  },
                  imagename: AppImageAsset.order1,
                  fieldname: "orders"),
              CustomFieldHomePageAdmin(
                  onTap: () {
                    Get.toNamed(AppRoute.adsview);
                  },
                  imagename: AppImageAsset.ads1,
                  fieldname: "Ads"),
            ],
          )
        ],
      ),
    );
  }
}

class CustomFieldHomePageAdmin extends StatelessWidget {
  final String imagename;
  final String fieldname;
  final Function()? onTap;
  const CustomFieldHomePageAdmin(
      {super.key,
      required this.imagename,
      required this.fieldname,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: AppColor.black)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagename,
              height: 150,
              width: 100,
              fit: BoxFit.fill,
            ),
            Text(
              fieldname,
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
