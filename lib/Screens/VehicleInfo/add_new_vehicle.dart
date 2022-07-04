import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Widgets/buttons.dart';

import '../../Constants/colors.dart';
import '../../Widgets/icon.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController vehiclenumberController =
      TextEditingController(text: "");
  TextEditingController vehiclecompanyController =
      TextEditingController(text: "");
  List vehicleBrand = ["Swift Dezire", "Maruti Suzuki", "Honda"];
  var vehiclebrandvalue = "Swift Dezire";
  List wheelList = ["2 Wheel", "4 Wheel", "8 Wheel"];
  String wheelvalue = "2 Wheel";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isError = false;

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
                  "Add New Vehicle",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        controller: vehiclenumberController,
                        onChanged: (val) {
                          print(val);
                          setState(() {
                            if (vehiclenumberController.text.length < 6) {
                              isError = true;
                            } else {
                              isError = false;
                            }
                            if (vehiclenumberController.text == "") {
                              isError = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Vehicle Number",
                          hintText: "Vehicle Number",
                          labelStyle: TextStyle(color: Color(0xff969696)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      isError
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.width * 0.04),
                              child: Text(
                                "Your Vehicle is not registered yet.\nPlease upload vehicle information manually",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffE04F4F),
                                    fontSize: 13,
                                    fontFamily: "Roboto"),
                              ),
                            )
                          : SizedBox(height: Get.height * 0.03),
                      TextFormField(
                        cursorColor: textcolor,
                        controller: vehiclecompanyController,
                        decoration: InputDecoration(
                          labelText: "Vehicle Company",
                          hintText: "Maruti",
                          labelStyle: TextStyle(color: Color(0xff969696)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        width: Get.width,
                        height: Get.height * 0.09,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 97, 97, 97)),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            menuMaxHeight: Get.height * 0.45,
                            icon: SvgPicture.asset(
                              "assets/icons/down.svg",
                              height: 8,
                              width: 8,
                            ),
                            isExpanded: true,
                            value: vehiclebrandvalue,
                            elevation: 5,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontFamily: "Roboto"),
                            items: vehicleBrand.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (selectedvalue) {
                              setState(() {
                                vehiclebrandvalue = selectedvalue.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        width: Get.width,
                        height: Get.height * 0.09,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 97, 97, 97)),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            menuMaxHeight: Get.height * 0.45,
                            icon: SvgPicture.asset(
                              "assets/icons/down.svg",
                              height: 8,
                              width: 8,
                            ),
                            isExpanded: true,
                            value: wheelvalue,
                            elevation: 5,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontFamily: "Roboto"),
                            items: wheelList.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (selectedvalue) {
                              setState(() {
                                wheelvalue = selectedvalue.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.1),
                      MyButton(
                        onpress: () {},
                        btntext: "Submit",
                      ),
                      SizedBox(height: Get.height * 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
