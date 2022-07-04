import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
Future proceedDialog(context) {
  return showDialog(
    context: context,
    builder: (ctx) => Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: Get.height * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/insurance.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "You are under insurance coverage\nplease proceed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.05, vertical: 10),
                  child: MyButton(onpress: () {}, btntext: "Proceed"),
                ),
                SizedBox(),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.close,
                size: 25,
                color: Color(0xffADADAD),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
