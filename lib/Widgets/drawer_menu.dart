import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Calendar/calendar_screen.dart';
import 'package:restowcustomer/Screens/ChangePassword/change_password.dart';
import 'package:restowcustomer/Screens/ContactUs/contact_us.dart';
import 'package:restowcustomer/Screens/Home/home_screen.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Screens/Payments/payments.dart';
import 'package:restowcustomer/Screens/Profile/profile_screen.dart';
import 'package:restowcustomer/Screens/Rating%20Review/rating_review.dart';
import 'package:restowcustomer/Screens/SignIn/sign_in_screen.dart';
import 'package:restowcustomer/Screens/VehicleInfo/vehicle_info.dart';
import 'package:restowcustomer/Screens/VehicleTow/vehicle_tow.dart';

import '../Screens/AboutUs/about_us.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var onTapIndex = 0;
  var onTapsetting;

  List drawerdata = [
    {"name": "Tow Request", "icon": "request"},
    {"name": "Settings", "icon": "settings"},
    {"name": "Notifications", "icon": "notification"},
    {"name": "Rate & Review", "icon": "star"},
    {"name": "Terms & Conditions", "icon": "info"},
    {"name": "About Us", "icon": "terms"},
    {"name": "Contact Us", "icon": "contact"},
    {"name": "Logout", "icon": "logout"},
  ];

  List settingname = [
    "Profile Info",
    "Vehicle Info",
    "Change Password",
    "Payment Info"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        width: size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.025, top: size.height * 0.05),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      child: CircleAvatar(
                        radius: Get.width * 0.1,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Johnson Doe",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF292929)),
                        ),
                        Text(
                          "info@johndeo.com",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFFA8A8A8)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Divider(
                  height: size.height * 0.05,
                  color: Color(0xFFE0E0E0),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: drawerdata.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == onTapIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 15, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.07,
                            width: size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/${drawerdata[index]['icon']}.svg",
                                      color: kPrimaryColor,
                                      height: 22,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Text(
                                      "${drawerdata[index]['name']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                index == 1
                                    ? SvgPicture.asset(
                                        "assets/icons/down.svg",
                                        height: 8,
                                        width: 8,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          index == 1
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: settingname.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: Get.width * 0.12,
                                          top: Get.width * 0.07),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            onTapsetting = index;
                                          });
                                          switch (index) {
                                            case 0:
                                              Get.to(ProfileScreen());
                                              break;
                                            case 1:
                                              Get.to(VehicleInfo());
                                              break;
                                            case 2:
                                              Get.to(ChangePassword());
                                              break;
                                            case 3:
                                              Get.to(PaymentScreen());
                                              break;
                                            default:
                                          }
                                        },
                                        child: Text(
                                          settingname[index],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: onTapsetting == index
                                                  ? kPrimaryColor
                                                  : Color(0xff696969)),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : SizedBox(),
                        ],
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        onTapIndex = index;
                      });

                      switch (index) {
                        case 0:
                          Get.to(HomeScreen());
                          break;
                        case 2:
                          Get.to(Notifications());
                          break;
                        case 3:
                          Get.to(RatingReviewScreen());
                          break;
                        case 4:
                          Get.to(CalendarScreen());
                          break;
                        case 5:
                          Get.to(AboutUs());
                          break;
                        case 6:
                          Get.to(ContactUs());
                          break;
                        case 7:
                          Get.offAll(SignInPage());
                          break;

                        default:
                      }
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.06, vertical: 4),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1, color: Color(0xffD6D6D6))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/${drawerdata[index]['icon']}.svg",
                                    color: Color(0xff3C3C3C),
                                    height: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                "${drawerdata[index]['name']}",
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                            ],
                          ),
                          index == 1
                              ? SvgPicture.asset(
                                  "assets/icons/down.svg",
                                  height: 8,
                                  width: 8,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
