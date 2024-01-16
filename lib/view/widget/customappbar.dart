import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery33/core/constant/routes.dart';

class CustomAppBar extends StatelessWidget {
  final String hinttext;
  final TextEditingController? mycontroller;
  final Function(String)? onchanged;
  final void Function()? pressforsearch;
  final void Function()? onpressnofic;
  final void Function()? onpressfavourite;
  const CustomAppBar(
      {super.key,
      required this.hinttext,
      this.pressforsearch,
      this.onpressnofic,
      required this.onpressfavourite,
      required this.onchanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onchanged,
          decoration: InputDecoration(
            prefixIcon: IconButton(
                onPressed: pressforsearch, icon: const Icon(Icons.search)),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 18),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: onpressfavourite,
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey[600],
                size: 30,
              )),
        )
      ],
    );
  }
}
