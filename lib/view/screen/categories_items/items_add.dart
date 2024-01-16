import 'package:delivery33/view/widget/auth/customtexttitleauth.dart';
import 'package:delivery33/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/items/itemsadd_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformfieldauth.dart';
import '../../widget/language/custombuttomlang.dart';

class itemsAdd extends StatelessWidget {
  const itemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddControllerImp controllerImp = Get.put(ItemsAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New item"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Form(
        key: controllerImp.formstate2,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const customTextTitleAuth(
                text: "Active - to add it right now to the store"),
            GetBuilder<ItemsAddControllerImp>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChoose(
                    data: "activate",
                    isChoosen: controller.activeState == 1 ? true : false,
                    onTap: () {
                      controller.change(0, 1);
                      print(controller.activeState);
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomChoose(
                    data: "deactivate",
                    isChoosen: controllerImp.activeState == 0 ? true : false,
                    onTap: () {
                      controller.change(1, 0);

                      print(controller.activeState);
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 100, "notlike");
                },
                lable: "catname",
                hint: "name in english",
                icon: Icons.abc,
                myController: controllerImp.itname,
                isNumber: false),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 100, "notlike");
                },
                lable: "catname",
                hint: "name in arabic",
                icon: Icons.abc,
                myController: controllerImp.itnamear,
                isNumber: false),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 255, "notlike");
                },
                lable: "desc",
                hint: "desc in english",
                icon: Icons.abc,
                myController: controllerImp.itdesc,
                isNumber: false),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 255, "notlike");
                },
                lable: "desc",
                hint: "desc in arabic",
                icon: Icons.abc,
                myController: controllerImp.itdescar,
                isNumber: false),
            customnewTextFormAuth(
              vaild: (val) {
                return validInput(val!, 1, 11, "notlike");
              },
              lable: "count",
              hint: "the count of this item",
              icon: Icons.check_box_outlined,
              myController: controllerImp.itcount,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
            ),
            customnewTextFormAuth(
              vaild: (val) {
                return validInput(val!, 2, 100, "notlike");
              },
              lable: "price",
              hint: "the price of this item",
              icon: Icons.price_change_outlined,
              myController: controllerImp.itprice,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
            ),
            customnewTextFormAuth(
              vaild: (val) {
                return validInput(val!, 1, 2, "notlike");
              },
              lable: "discount",
              hint: "the discount , 0 if there are not",
              icon: Icons.price_check_outlined,
              myController: controllerImp.itdiscount,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
            ),
            GetBuilder<ItemsAddControllerImp>(
              builder: (controller) => Column(
                children: [
                  CustomButtonAuth(
                    text: "item Image",
                    onPressed: () {
                      Get.bottomSheet(ChooseImageOptions(
                        onTapCamera: () {
                          controller.chooseCamera();
                        },
                        onTapGallery: () {
                          controller.chooseGallery();
                        },
                      ));
                    },
                  ),
                  if (controllerImp.image != null)
                    Image.file(
                      controllerImp.image!,
                      width: 100,
                      height: 100,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            customButtonLang(
              title: "ADD",
              onPressed: () {
                controllerImp.addData();
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomChoose extends StatelessWidget {
  final String data;
  final Function()? onTap;
  final bool isChoosen;
  const CustomChoose(
      {super.key,
      required this.data,
      required this.isChoosen,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration:
              BoxDecoration(color: isChoosen ? Colors.green : Colors.red),
          child: Text(
            data,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}

class ChooseImageOptions extends StatelessWidget {
  final Function()? onTapCamera;
  final Function()? onTapGallery;
  const ChooseImageOptions({super.key, this.onTapCamera, this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: AppColor.white),
      height: 120,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const CustomTitleHome(text: "please choose image"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTapCamera,
              child: Container(
                  alignment: Alignment.center,
                  width: 125,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: AppColor.primaryColor, width: 3)),
                  child: const Text(
                    "Camera",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: onTapGallery,
              child: Container(
                  alignment: Alignment.center,
                  width: 125,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: AppColor.primaryColor, width: 3)),
                  child: const Text(
                    "Gallery",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
