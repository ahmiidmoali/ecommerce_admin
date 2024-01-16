// import 'package:flutter/material.dart';
// import 'package:delivery33/controller/itemsdetails_controller.dart';
// import 'package:delivery33/core/class/handlingdataview.dart';
// import 'package:delivery33/core/constant/appcolor.dart';
// import 'package:get/get.dart';
// import 'package:delivery33/core/constant/routes.dart';

// import '../widget/itemsdetails/customcoloritemsdetails.dart';
// import '../widget/itemsdetails/customimageitemsdetails.dart';
// import '../widget/itemsdetails/custompriceitemsdetails.dart';

// class itemsDetails extends StatelessWidget {
//   const itemsDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           height: 50,
//           margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//           decoration: BoxDecoration(
//               color: AppColor.primaryColor,
//               borderRadius: BorderRadius.circular(20)),
//           child: MaterialButton(
//             onPressed: () {
//               Get.toNamed(AppRoute.cartpage);
//             },
//             child: const Text(
//               "GO To Cart",
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.white),
//             ),
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           const CustomImageItemsDetails(),
//           const SizedBox(
//             height: 100,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             child: Text(
//               "${controller.itemsmodel.itemsName}",
//               style: Theme.of(context)
//                   .textTheme
//                   .displayLarge!
//                   .copyWith(fontSize: 25, color: AppColor.largetext),
//             ),
//           ),
//           CustomPriceItemsDetails(
//             countwidget: GetBuilder<ItemsDetailsControllerImp>(
//                 builder: (controller) => Text(
//                       "${controller.countitems}",
//                       style: TextStyle(fontSize: 25, height: 1),
//                     )),
//             addBottun: () {
//               controller.add();
//             },
//             removeBottun: () {
//               controller.remove();
//             },
//             price:
//                 "${(controller.itemsmodel.itemsPrice! - controller.itemsmodel.itemsPrice! * controller.itemsmodel.itemsDiscount! / 100)} \$ ",
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               "${controller.itemsmodel.itemsDesc}",
//               style: Theme.of(context)
//                   .textTheme
//                   .displaySmall!
//                   .copyWith(fontSize: 18),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Color",
//               style: Theme.of(context)
//                   .textTheme
//                   .displayLarge!
//                   .copyWith(fontSize: 25, color: AppColor.largetext),
//             ),
//           ),
//           const CustomColorItemsDetails()
//         ],
//       ),
//     );
//   }
// }
