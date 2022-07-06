import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/drawer_menu.dart';

import '../../Widgets/icon.dart';
import '../../Widgets/notinsurance_dialog.dart';

class VehicleTowPage extends StatefulWidget {
  const VehicleTowPage({Key? key}) : super(key: key);

  @override
  State<VehicleTowPage> createState() => _VehicleTowPageState();
}

class _VehicleTowPageState extends State<VehicleTowPage> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  final items = ['Select Vehicle', 'SBN 14 52 4', 'SBN 14 52 2', 'SBN 14 542'];
  String selectedValue = 'Select Vehicle';
  List paylist = ["Direct Invoice", "Pay By Card", "Insurance", "Bank / Fund"];
  int payindex = 0;
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  Future pickImgs() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  String isSelectCard = "Car towing";
  TextEditingController numberController = TextEditingController(text: "");
  TextEditingController brandController = TextEditingController(text: "");
  TextEditingController modelController = TextEditingController(text: "");
  TextEditingController wheelController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List row1 = [
    {"name": "Car Towing", "img": "icon1"},
    {"name": "Motorcycle Towing", "img": "icon2"},
    {"name": "Tow Truck", "img": "icon3"},
  ];
  List row2 = [
    {"name": "Car Strat-up", "img": "icon4"},
    {"name": "Towing of Heavy Equip.", "img": "icon5"},
    {"name": "Opening Door", "img": "icon6"},
  ];
  List row3 = [
    {"name": "Emptying Tank", "img": "icon7"},
    {"name": "Car Battery Replacement", "img": "icon8"},
    {"name": "Fault Diagnosis", "img": "icon9"},
  ];
  List row4 = [
    {"name": "Tire Service", "img": "icon10"},
    {"name": "Car Transportation", "img": "icon11"},
    {"name": "Machine Transport", "img": "icon12"},
  ];

  bool isDropdownOpen = false;
  bool isFormOpen = false;
  TextEditingController descController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldkey,
        drawer: const MyDrawer(),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.15), // here the desired height
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.width * 0.02),
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  const Center(
                    child: Text(
                      "Please add details to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: ksecondarytextcolor,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "Select Vehicle",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        color: textcolor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isDropdownOpen = !isDropdownOpen;
                      setState(() {});
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.width * 0.17,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffF7F6FB),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedValue,
                            style: const TextStyle(
                                color: Color(0xffC3C3C3),
                                fontSize: 15,
                                fontFamily: "Roboto"),
                          ),
                          SvgPicture.asset(
                            "assets/icons/down.svg",
                            height: 8,
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isDropdownOpen
                      ? Card(
                          elevation: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  selectedValue = items[index].toString();
                                  isDropdownOpen = false;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: items.length - 1 == index
                                      ? const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)))
                                      : const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(items[index]),
                                      ),
                                      items.length - 1 != index
                                          ? const Divider()
                                          : const SizedBox(
                                              height: 5,
                                            )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.03,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFormOpen = !isFormOpen;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        width: Get.width,
                        color: kPrimaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Partner's Vehicle / Add New Vehicle",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Roboto"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  isFormOpen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Vehicle Number",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: textcolor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F6FB),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: numberController,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(
                                      fontSize: 17, color: textcolor),
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        fontSize: 17, color: Color(0xffC3C3C3)),
                                    hintText: 'Vehicle Number',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.all(Get.width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            const Text(
                              "Vehicle Brand",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: textcolor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F6FB),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: brandController,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(
                                      fontSize: 17, color: textcolor),
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        fontSize: 17,
                                        color: const Color(0xffC3C3C3)),
                                    hintText: 'Vehicle Brand',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.all(Get.width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              "Vehicle Model",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: textcolor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F6FB),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: modelController,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(
                                      fontSize: 17, color: textcolor),
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        fontSize: 17,
                                        color: const Color(0xffC3C3C3)),
                                    hintText: 'Vehicle Model',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.all(Get.width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            const Text(
                              "Vehicle Wheel",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                color: textcolor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF7F6FB),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  controller: wheelController,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(
                                      fontSize: 17, color: textcolor),
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        fontSize: 17,
                                        color: const Color(0xffC3C3C3)),
                                    hintText: 'Vehicle Wheel',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.all(Get.width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                          ],
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelectCard = row1[0]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row1[0]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row1[0]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row1[0]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              isSelectCard = row1[1]["name"];
                              setState(() {});
                            },
                            child: Container(
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelectCard == row1[1]["name"]
                                      ? const Color(0xffCAFACC)
                                      : const Color(0xffEAEAEA)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(),
                                  SvgPicture.asset(
                                    "assets/icons/${row1[1]['img']}.svg",
                                    height: Get.width * 0.07,
                                    width: Get.width * 0.07,
                                    color: const Color(0xff818181),
                                  ),
                                  Text(
                                    row1[1]["name"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: const Color(0xff818181),
                                        fontSize: 10.5),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            isSelectCard = row1[2]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row1[2]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row1[2]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row1[2]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //row2
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelectCard = row2[0]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row2[0]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row2[0]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row2[0]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              isSelectCard = row2[1]["name"];
                              setState(() {});
                            },
                            child: Container(
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelectCard == row2[1]["name"]
                                      ? const Color(0xffCAFACC)
                                      : const Color(0xffEAEAEA)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(),
                                  SvgPicture.asset(
                                    "assets/icons/${row2[1]['img']}.svg",
                                    height: Get.width * 0.07,
                                    width: Get.width * 0.07,
                                    color: const Color(0xff818181),
                                  ),
                                  Text(
                                    row2[1]["name"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: const Color(0xff818181),
                                        fontSize: 10.5),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            isSelectCard = row2[2]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row2[2]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row2[2]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row2[2]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //row3
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelectCard = row3[0]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row3[0]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row3[0]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row3[0]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              isSelectCard = row3[1]["name"];
                              setState(() {});
                            },
                            child: Container(
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelectCard == row3[1]["name"]
                                      ? const Color(0xffCAFACC)
                                      : const Color(0xffEAEAEA)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(),
                                  SvgPicture.asset(
                                    "assets/icons/${row3[1]['img']}.svg",
                                    height: Get.width * 0.07,
                                    width: Get.width * 0.07,
                                    color: const Color(0xff818181),
                                  ),
                                  Text(
                                    row3[1]["name"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: const Color(0xff818181),
                                        fontSize: 10.5),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            isSelectCard = row3[2]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row3[2]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row3[2]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row3[2]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //row4

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelectCard = row4[0]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row4[0]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row4[0]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row4[0]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              isSelectCard = row4[1]["name"];
                              setState(() {});
                            },
                            child: Container(
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelectCard == row4[1]["name"]
                                      ? const Color(0xffCAFACC)
                                      : const Color(0xffEAEAEA)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(),
                                  SvgPicture.asset(
                                    "assets/icons/${row4[1]['img']}.svg",
                                    height: Get.width * 0.07,
                                    width: Get.width * 0.07,
                                    color: const Color(0xff818181),
                                  ),
                                  Text(
                                    row4[1]["name"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: const Color(0xff818181),
                                        fontSize: 10.5),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            isSelectCard = row4[2]["name"];
                            setState(() {});
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelectCard == row4[2]["name"]
                                    ? const Color(0xffCAFACC)
                                    : const Color(0xffEAEAEA)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                SvgPicture.asset(
                                  "assets/icons/${row4[2]['img']}.svg",
                                  height: Get.width * 0.07,
                                  width: Get.width * 0.07,
                                  color: const Color(0xff818181),
                                ),
                                Text(
                                  row4[2]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: const Color(0xff818181),
                                      fontSize: 10.5),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: InkWell(
                      onTap: () {
                        pickImgs();
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.width * 0.17,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xffF7F6FB),
                            borderRadius: BorderRadius.circular(7)),
                        child: DottedBorder(
                          color: const Color(0xffB9B9B9),
                          strokeWidth: 1,
                          dashPattern: [4, 4, 4],
                          borderType: BorderType.Rect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: Get.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/upload.svg",
                                  height: Get.width * 0.08,
                                  width: Get.width * 0.08,
                                  color: const Color(0xff0037A6),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Upload Images",
                                  style: TextStyle(
                                      color: Color(0xff0037A6),
                                      fontSize: 15,
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  imagefiles != null
                      ? Container(
                          height: Get.height * 0.15,
                          width: Get.width,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                Padding(padding: EdgeInsets.only(right: 5)),
                            scrollDirection: Axis.horizontal,
                            itemCount: imagefiles!.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index < 3) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: Get.height * 0.14,
                                      width: Get.width * 0.28,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: FileImage(File(
                                                  imagefiles![index].path))),
                                          color: const Color(0xffEAEAEA)),
                                    ),
                                    Positioned(
                                        top: 8,
                                        right: 8,
                                        child: SvgPicture.asset(
                                          "assets/icons/remove.svg",
                                          height: Get.width * 0.06,
                                        ))
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        )
                      : Container(),

                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  const Text(
                    "Briefly Describe",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      color: textcolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F6FB),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: descController,
                        maxLines: 3,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 17, color: const Color(0xffC3C3C3)),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              fontSize: 17, color: const Color(0xffC3C3C3)),
                          hintText: 'Lorem...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(Get.width * 0.05),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "How do you want to pay?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.02,
                    ),
                    child: Container(
                      height: Get.width * 0.12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: paylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  payindex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                color: payindex == index
                                    ? kPrimaryColor
                                    : const Color(0xffE8F1E5),
                                child: Text(
                                  paylist[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: payindex == index
                                          ? Colors.white
                                          : const Color(0xff4E6B57),
                                      fontSize: 12.5,
                                      fontFamily: "Roboto"),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  MyButton(
                      onpress: () {
                        notInsuranceDialog(context);
                      },
                      btntext: "Submit"),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
