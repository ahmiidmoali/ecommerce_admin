import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:delivery33/controller/notifications_controller.dart';
import 'package:delivery33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:delivery33/data/model/notificationsmodel.dart';

class notificationsPage extends StatelessWidget {
  const notificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsController controller = Get.put(NotificationsController());
    return Container(
        child: ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
          ),
          height: 50,
          alignment: Alignment.center,
          child: Text(
            "Notifications",
            style: TextStyle(
                fontSize: 25,
                color: AppColor.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        GetBuilder<NotificationsController>(
          builder: (controller) {
            return Column(
              children: [
                ...List.generate(
                    controller.data.length,
                    (index) => NotificationCard(
                          notificationsModel: controller.data[index],
                        ))
              ],
            );
          },
        )
      ],
    ));
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationsModel notificationsModel;
  const NotificationCard({super.key, required this.notificationsModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("${notificationsModel.notificationsTitle}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor)),
                Spacer(),
                Text(
                    "${Jiffy(notificationsModel.notificationsDatetime).fromNow()}",
                    style: TextStyle(
                      fontSize: 15,
                    ))
              ],
            ),
            Text("${notificationsModel.notificationsBody}",
                style: TextStyle(
                  fontSize: 18,
                ))
          ],
        ),
      ),
    );
  }
}
