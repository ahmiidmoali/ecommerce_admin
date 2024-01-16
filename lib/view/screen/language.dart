import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/core/localization/changelocal.dart';
import 'package:delivery33/view/widget/language/custombuttomlang.dart';

class language extends GetView<LocaleController> {
  const language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            customButtonLang(
              title: "2".tr, //Arabic
              onPressed: () {
                controller.changelang("ar");

                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            customButtonLang(
              title: "3".tr, //English
              onPressed: () {
                controller.changelang("en");

                Get.toNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
