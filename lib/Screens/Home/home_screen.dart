import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/VehicleTow/vehicle_tow.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';

import '../../Widgets/drawer_menu.dart';
import '../Notifications/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Center(
            child: InkWell(
                onTap: () {}, child: Image.asset("assets/images/splash.png")),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: Get.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        scaffoldkey.currentState!.openDrawer();
                      },
                      child: const AppIcon(
                        icon: Icons.menu,
                      ),
                    ),
                    Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(width: 0, color: Colors.white)),
                      elevation: 6,
                      child: Container(
                        // height: Get.width * 0.14,
                        width: Get.width * 0.6,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Your Location",
                              style: const TextStyle(
                                color: textcolor,
                                fontSize: 11,
                              ),
                            ),
                            const Text(
                              "83250 Hermosillo, Mexico",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Notifications());
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.08, vertical: Get.width * 0.05),
                width: Get.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Form(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF7F6FB),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 17, color: Color(0xffC3C3C3)),
                            hintText: 'Where to go?',
                            suffixIcon: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                )),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(Get.width * 0.05),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                            onpress: () {
                              Get.to(VehicleTowPage());
                            },
                            widths: Get.width * 0.4,
                            btnfontsize: 17.0,
                            btntext: "Tow Now"),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.0, 8.0),
                              ),
                            ],
                          ),
                          width: Get.width * 0.4,
                          height: Get.height * 0.08,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kPrimaryColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: kPrimaryColor, width: 1)),
                              ),
                            ),
                            child: Text(
                              "Ask For Offer",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
