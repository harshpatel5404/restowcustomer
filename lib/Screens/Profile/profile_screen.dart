import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Profile/edit_profile.dart';
import 'package:restowcustomer/Screens/SignUp/sign_up_screen.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';

import '../Notifications/notifications.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
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
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Notifications());
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(width: 0, color: Colors.white)),
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
              SizedBox(
                height: Get.height * 0.05,
              ),
              Container(
                height: Get.height * 0.58,
                //
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Get.width * 0.1,
                          bottom: 0,
                          left: Get.width * 0.075,
                          right: Get.width * 0.075),
                      child: Container(
                        margin: EdgeInsets.only(top: Get.width * 0.05),
                        height: Get.height * 0.6,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 4.0,
                                spreadRadius: 1),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: Get.width * 0.35,
                      child: Container(
                        height: Get.width * 0.32,
                        width: Get.width * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: kPrimaryColor, width: 2)),
                        child: CircleAvatar(
                          radius: Get.width * 0.15,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.2,
                      left: Get.width * 0.14,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7.0),
                                  child: Text(
                                    "Driver Name",
                                    style: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ":   Johnson Doe",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: const Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7.0),
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ":   john@dummy.com",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.0),
                                  child: Text(
                                    "Contact",
                                    style: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ":   033 2265 1318",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.0),
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ":   ",
                                maxLines: 4,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                width: Get.width * 0.4,
                                child: Text(
                                  "Palmar del Sol, 83250 Hermosillo, Son., Mexico",
                                  maxLines: 4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.0),
                                  child: Text(
                                    "Postcode",
                                    style: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                ":   35152",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.08, vertical: Get.width * 0.04),
                child: MyButton(
                    onpress: () {
                      Get.to(EditProfile(
                        name: "Johnson Do",
                        phone: "033 2264 1318",
                        address: "Palmar del Sol, 83250 Hermosillo, S...",
                        postcode: "35152",
                        vehicleno: "SD3231",
                      ));
                    },
                    btntext: "Edit Profile"),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
