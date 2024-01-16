import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:delivery33/controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/class/handlingdataview.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/data/model/itemsmodel.dart';
import 'package:delivery33/linkapi.dart';
import 'package:delivery33/view/widget/customappbar.dart';
import 'package:delivery33/view/widget/home/customcardhome.dart';
import 'package:delivery33/view/widget/home/listcategorieshome.dart';
import 'package:delivery33/view/widget/home/listitemshome.dart';

import '../widget/home/customtitlehome.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            CustomAppBar(
              pressforsearch: () {
                controller.doSearch();
              },
              mycontroller: controller.searchcontroller,
              onchanged: (p0) {
                controller.checkchanges(p0);
              },
              hinttext: "Find Product",
              onpressfavourite: () {
                Get.toNamed(AppRoute.myfavourite);
              },
            ),
            handlingDataView(
                statusRequest: controller.statusRequest!,
                widget: !controller.ischanges
                    ? Column(
                        children: [
                          if (controller.discounts)
                            CustomCardHome(
                                title: controller.title,
                                body:
                                    "${controller.body} ${controller.discount}% "),
                          CustomTitleHome(text: "Categories"),
                          ListCategoriesHome(),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTitleHome(text: "Top Selling"),
                          ListItemsHome()
                        ],
                      )
                    : ListSearchData(itemsmodel: controller.listdata))
          ],
        ),
      ),
    );
  }
}

class ListSearchData extends GetView<HomePageControllerImp> {
  final List<Itemsmodel> itemsmodel;

  ListSearchData({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.listdata.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToItemsDetails(itemsmodel[index]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          height: 100,
          child: Card(
            color: AppColor.background,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${itemsmodel[index].itemsImage}",
                      height: 80,
                      width: 100,
                    )),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        "${itemsmodel[index].itemsName}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      subtitle: Text("${itemsmodel[index].categoriesName}"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
