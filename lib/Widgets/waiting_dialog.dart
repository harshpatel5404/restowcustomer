import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future waitingDialog(context) {
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
                  "assets/images/wait.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Wait !!",
                  style: const TextStyle(
                      color: Color(0xff578A27),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                const Text(
                  "Let us check your insurance\ncoverage status.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
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
