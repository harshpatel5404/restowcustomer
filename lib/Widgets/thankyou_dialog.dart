
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Widgets/buttons.dart';

Future thankyouDialog(context) {
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
            height: Get.height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/thankyou.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Thank You! ",
                  style: const TextStyle(
                      color: Color(0xff578A27),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                const Text(
                  "A driver will be assigned for your location\nto pick up your vehicle.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Booking ID : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    ),
                    Text(
                      "XXXXX",
                      style: TextStyle(
                          color: Color(0xff578A27),
                          fontSize: 17,
                          fontFamily: "Roboto"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.05, vertical: Get.width * 0.08),
                  child: MyButton(
                      onpress: () {
                        Get.back();
                      },
                      btntext: "Ok"),
                ),
                SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
