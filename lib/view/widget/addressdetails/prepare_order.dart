import 'package:delivery33/view/widget/auth/custombuttonauth.dart';
import 'package:delivery33/view/widget/homescreen/custombottomappbar.dart';
import 'package:flutter/material.dart';

class PrepareOrder extends StatelessWidget {
  final Function()? acceptorder;
  final Function()? confirmorder;
  final bool myisprepared;
  const PrepareOrder(
      {super.key,
      this.acceptorder,
      this.confirmorder,
      required this.myisprepared});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomButtonAuth(text: "check the items", onPressed: confirmorder),
          if (myisprepared == true)
            CustomButtonAuth(
              text: "approve the order",
              onPressed: acceptorder,
            )
        ],
      ),
    );
  }
}
