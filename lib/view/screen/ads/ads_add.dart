import 'package:delivery33/view/widget/auth/customtexttitleauth.dart';
import 'package:delivery33/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/categories/items/itemsadd_controller.dart';
import '../../../../core/constant/appcolor.dart';
import '../../../../core/functions/validinput.dart';
import '../../../controller/ads/adsadd_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformfieldauth.dart';
import '../../widget/language/custombuttomlang.dart';

class adsAdd extends StatelessWidget {
  const adsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AdsAddControllerImp controllerImp = Get.put(AdsAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add this item"),
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
            GetBuilder<AdsAddControllerImp>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChoose(
                    data: "product",
                    isChoosen: controller.adstype == 1 ? true : false,
                    onTap: () {
                      controller.change(0, 1);
                      print(controller.adstype);
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomChoose(
                    data: "link",
                    isChoosen: controllerImp.adstype == 0 ? true : false,
                    onTap: () {
                      controller.change(1, 0);

                      print(controller.adstype);
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<AdsAddControllerImp>(
              builder: (controller) => Column(
                children: [
                  if (controllerImp.adstype == 0)
                    customnewTextFormAuth(
                      vaild: (val) {
                        return validInput(val!, 1, 2, "notlike");
                      },
                      lable: "link",
                      hint: "the discount , 0 if there are not",
                      icon: Icons.price_check_outlined,
                      myController: controllerImp.adscontent,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                    ),
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
