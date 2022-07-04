import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future notInsuranceDialog(context) {
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
            height: Get.height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(),
                const Text(
                  "Your vehical is not insured.",
                  style: const TextStyle(
                      color: Color(0xff578A27),
                      fontSize: 20,
                      fontFamily: "Roboto"),
                ),
                const Text(
                  "Please select defferent payment option.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 15,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 10,
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
