import 'package:delivery33/controller/categories/categoriesadd_controller.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:delivery33/core/functions/uploadfile.dart';
import 'package:delivery33/core/functions/validinput.dart';
import 'package:delivery33/view/widget/auth/custombuttonauth.dart';
import 'package:delivery33/view/widget/auth/customtextformfieldauth.dart';
import 'package:delivery33/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class categoriesAdd extends StatelessWidget {
  const categoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAddControllerImp controllerImp =
        Get.put(CategoriesAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Categories"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Form(
        key: controllerImp.formstate1,
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 100, "notlike");
                },
                lable: "catname",
                hint: "name in english",
                icon: Icons.abc,
                myController: controllerImp.catname,
                isNumber: false),
            customTextFormAuth(
                vaild: (val) {
                  return validInput(val!, 2, 100, "notlike");
                },
                lable: "catname",
                hint: "name in arabic",
                icon: Icons.abc,
                myController: controllerImp.catnamear,
                isNumber: false),
            GetBuilder<CategoriesAddControllerImp>(
              builder: (controller) => Column(
                children: [
                  CustomButtonAuth(
                    text: "Category Image",
                    onPressed: () {
                      controllerImp.chooseFile();
                    },
                  ),
                  if (controllerImp.image != null)
                    SvgPicture.file(
                      controllerImp.image!,
                      width: 100,
                      height: 100,
                    ),
                ],
              ),
            ),
            SizedBox(
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
