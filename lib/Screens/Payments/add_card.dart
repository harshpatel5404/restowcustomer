import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Widgets/buttons.dart';

import '../../Constants/colors.dart';
import '../../Widgets/icon.dart';

class AddPayCard extends StatefulWidget {
  const AddPayCard({Key? key}) : super(key: key);

  @override
  State<AddPayCard> createState() => _AddPayCardState();
}

class _AddPayCardState extends State<AddPayCard> {
  TextEditingController cardnumberController = TextEditingController(text: "");
  TextEditingController cardnameController = TextEditingController(text: "");
  TextEditingController validtillController = TextEditingController(text: "");
  TextEditingController cvvController = TextEditingController(text: "");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isChecked = false;

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
                  "Pay With Card",
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
                SizedBox(height: Get.height * 0.02),
                Text(
                  "Add New Debit/Credit Card",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.04),
                      TextFormField(
                        cursorColor: textcolor,
                        controller: cardnumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Card Number",
                          hintText: "0621 3215 XXXX XXXX",
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
                      TextFormField(
                        cursorColor: textcolor,
                        controller: validtillController,
                        decoration: InputDecoration(
                          labelText: "Valid Till",
                          hintText: "11/25",
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
                      TextFormField(
                        cursorColor: textcolor,
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "CVV",
                          hintText: "3XX",
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
                      TextFormField(
                        cursorColor: textcolor,
                        controller: cardnameController,
                        decoration: InputDecoration(
                          labelText: "Card Holder Name",
                          hintText: "Card Holder Name",
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
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              isChecked = !isChecked;
                              setState(() {});
                            },
                            child: Container(
                              height: Get.width * 0.08,
                              width: Get.width * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Card(
                                elevation: 3,
                                child: isChecked
                                    ? Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/mark.svg",
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Text(
                            " Mark as a default ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
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
