import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Payments/pay_screen.dart';
import 'package:restowcustomer/Widgets/icon.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> notitext = [
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
    "Driver john doe will rich in 30 min with vahicale no DS321521. Please make payment to continue...",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back,
                      )),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff292929),
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  Text(
                    "Clear All",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7BBE1F),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: notitext.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 != 0) {
                      return InkWell(
                        onTap: () {
                          Get.to(PayScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF3F3F3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03,
                                  vertical: Get.width * 0.05),
                              child: Text(
                                notitext[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () {
                          Get.to(PayScreen());

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white)),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.03,
                                vertical: Get.width * 0.05),
                            child: Text(
                              notitext[index],
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff626262)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
