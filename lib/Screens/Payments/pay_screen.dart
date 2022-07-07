import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';
import 'package:restowcustomer/Widgets/text_widget.dart';

import '../../Constants/colors.dart';
import '../../Widgets/drawer_menu.dart';
import '../../Widgets/thankyou_dialog.dart';
import '../Notifications/notifications.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const MyDrawer(),
      body: Stack(
        children: [
           const GoogleMap(
            initialCameraPosition: CameraPosition(
              target:  LatLng(62.750411, 26.140096),
              zoom: 4,
            ),
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
              Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            width: Get.width * 0.8,
                            alignment: Alignment.center,
                            child: const Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 5.0),
                              child: const Text(
                                "Jonson has accepted your booking request & will arrive shortly. Please make the payment to continue the process...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xffA1AA94),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: Get.height * 0.045,
                                    backgroundImage:
                                        const AssetImage("assets/images/profile.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          " John doe",
                                          style: const TextStyle(
                                            color: const Color(0xff333333),
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Text(
                                          "Service Completed : 105",
                                          style: const TextStyle(
                                              color: const Color(0xff7E7E7E),
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar(
                                              initialRating: 4,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: Get.width * 0.04,
                                              ratingWidget: RatingWidget(
                                                full: Container(
                                                  height: Get.height * 0.02,
                                                  width: Get.height * 0.02,
                                                  child: Image.asset(
                                                    'assets/images/fullrate.png',
                                                  ),
                                                ),
                                                empty: Image.asset(
                                                  'assets/images/emptyrate.png',
                                                  color: Colors.grey[300],
                                                ),
                                                half: const SizedBox(),
                                              ),
                                              itemPadding: const EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            const Text(
                                              "(4.0)",
                                              style: const TextStyle(
                                                  color: const Color(0xff7E7E7E),
                                                  fontSize: 13.5,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: const BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                elevation: 1,
                                child: const Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: kPrimaryColor,
                                    child: const Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const TextWidget(
                          text1: " Contact No : ",
                          text2: "632145121",
                        ),
                        const TextWidget(
                          text1: " Vehicle No : ",
                          text2: "SD25132",
                        ),
                        const TextWidget(
                          text1: " Vehicle Type : ",
                          text2: "Medium Tow Van",
                        ),
                        const TextWidget(
                          text1: " Verification Code : ",
                          text2: "2253",
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "\$232",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                            ),
                            Expanded(
                              child: MyButton(
                                  widths: Get.width,
                                  onpress: () {
                                    thankyouDialog(context);
                                  },
                                  btntext: "Pay Now"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
