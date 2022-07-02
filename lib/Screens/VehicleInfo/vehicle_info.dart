import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';
import 'package:restowcustomer/Widgets/text_widget.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({Key? key}) : super(key: key);

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  var ischecked = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.15), // here the desired height
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(
                          icon: Icons.arrow_back,
                        )),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Text(
                      "Vehicle Info",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                    elevation: 8,
                    child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.03),
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          height: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height * 0.175,
                            width: Get.width,
                            child: Card(
                              elevation: 8,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: Get.width * 0.05,
                                  bottom: Get.width * 0.05,
                                  left: Get.width * 0.05,
                                  right: Get.width * 0.03,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "SBN 15 12 22",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ischecked = index;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: Get.width * 0.08,
                                            width: Get.width * 0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              child: ischecked == index
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/mark.svg",
                                                        color: kPrimaryColor,
                                                      ),
                                                    )
                                                  : SizedBox(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Maruti  |  Maruti 800   |  4 Wheeler",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: Get.width * 0.05,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(60),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.white)),
                                    elevation: 8,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.03),
                                        child: SvgPicture.asset(
                                          "assets/icons/edit.svg",
                                          height: 20,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(60),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.white)),
                                    elevation: 8,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.03),
                                        child: SvgPicture.asset(
                                          "assets/icons/delete.svg",
                                          height: 20,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.04),
              child: MyButton(onpress: () 
              {
                
              }, btntext: "Add New Vehicle"),
            )
          ],
        ),
      ),
    );
  }
}
