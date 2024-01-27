import 'package:delivery33/view/screen/categories_items/categories_add.dart';
import 'package:delivery33/view/screen/categories_items/categories_view.dart';
import 'package:delivery33/view/screen/categories_items/items/items_add.dart';
import 'package:delivery33/view/screen/categories_items/items/items_edit.dart';
import 'package:delivery33/view/screen/categories_items/items/items_view.dart';
import 'package:delivery33/view/screen/orders/orders_screen.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/routes.dart';
import 'package:delivery33/core/middleware/mymiddleware.dart';

import 'package:delivery33/view/screen/auth/verifycodesignup.dart';

import 'package:delivery33/view/screen/auth/login.dart';

import 'package:delivery33/view/screen/auth/signup.dart';

import 'package:delivery33/view/screen/auth/sucesssignup.dart';

import 'package:delivery33/view/screen/homescreen.dart';
import 'package:delivery33/view/screen/itemsdetails.dart';
import 'package:delivery33/view/screen/itemspage.dart';
import 'package:delivery33/view/screen/language.dart';

import 'package:delivery33/view/screen/onboarding.dart';
import 'package:delivery33/view/screen/orders/archive.dart';
import 'package:delivery33/view/screen/orders/ordersdetails.dart';
import 'package:delivery33/view/screen/orders/pending.dart';
import 'package:delivery33/view/screen/profile.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const testView()),
  //auth
  GetPage(
    name: AppRoute.login,
    page: () => const login(),
  ),
  GetPage(name: AppRoute.signUp, page: () => const signUp()),
  GetPage(name: AppRoute.verifysignup, page: () => const checkMail()),
  GetPage(name: AppRoute.successsignup, page: () => const successSignUp()),
  //forget password

  //onboarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //homepage
  GetPage(name: AppRoute.homepage, page: () => const homeScreen()),
  GetPage(name: AppRoute.profile, page: () => const profilePage()),
  //itemspage
  // GetPage(name: AppRoute.itemspage, page: () => const itemsPage()),
  // GetPage(name: AppRoute.itemsdetails, page: () => const itemsDetails()),

  //address

  //orders checkout

  GetPage(name: AppRoute.pending, page: () => const pendingorders()),
  GetPage(name: AppRoute.orderdetails, page: () => const orderDetails()),
  GetPage(name: AppRoute.orderarchive, page: () => const archiveorders()),
  //----items and catregories----------------------------------------
  //--items
  GetPage(name: AppRoute.itemsview, page: () => const itemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const itemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const itemsEdit()),
  //--categories
  GetPage(name: AppRoute.catadd, page: () => const categoriesAdd()),
  GetPage(name: AppRoute.catview, page: () => const categoriesView()),
  //--orders
  GetPage(name: AppRoute.orderscreen, page: () => const ordersScreen()),
];




// Map<String, Widget Function(BuildContext)> routes = {
//   //auth
//   AppRoute.login: (p0) => const login(),
//   AppRoute.signUp: (p0) => const signUp(),
//   AppRoute.checkemail: (p0) => const checkMail(),
//   AppRoute.successsignup: (p0) => const successSignUp(),
//   //forget password
//   AppRoute.forgetPassword: (p0) => const forgetPassword(),
//   AppRoute.verifyCode: (p0) => const verifyCode(),
//   AppRoute.resetPassword: (p0) => const resetPassword(),
//   AppRoute.successResetPassword: (p0) => const successResetPassword(),
//   //onboarding
//   AppRoute.onBoarding: (p0) => const OnBoarding()
// };
