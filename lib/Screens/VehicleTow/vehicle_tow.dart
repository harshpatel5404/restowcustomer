import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/drawer_menu.dart';

import '../../Widgets/icon.dart';

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

  bool isDropdownOpen = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                  child: Container(
                    // height: Get.height * 0.06,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    width: Get.width,
                    color: kPrimaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Partner’s Vehicle / Add New Vehicle",
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
                const BuildTowingCard(
                  name1: "Car Towing",
                  name2: "Motorcycle Towing",
                  name3: "Tow Truck",
                  icon1: "icon1",
                  icon2: "icon2",
                  icon3: "icon3",
                ),
                const BuildTowingCard(
                  name1: "Car Strat-up",
                  name2: "Towing of Heavy Equip.",
                  name3: "Opening Door",
                  icon1: "icon4",
                  icon2: "icon5",
                  icon3: "icon6",
                ),
                const BuildTowingCard(
                  name1: "Emptying  Tank",
                  name2: "Car Battery Replacement",
                  name3: "Fault Diagnosis",
                  icon1: "icon7",
                  icon2: "icon8",
                  icon3: "icon9",
                ),
                const BuildTowingCard(
                  name1: "Tire Service",
                  name2: "Car Transportation",
                  name3: "Machine Transport",
                  icon1: "icon10",
                  icon2: "icon11",
                  icon3: "icon12",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                  child: InkWell(
                    onTap: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Get.height * 0.14,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/images/img2.png")),
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
                    ),
                    Stack(
                      children: [
                        Container(
                          height: Get.height * 0.14,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/images/img2.png")),
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
                    ),
                    Stack(
                      children: [
                        Container(
                          height: Get.height * 0.14,
                          width: Get.width * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/images/img2.png")),
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
                    ),
                  ],
                ),
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
                  child: Form(
                    key: formkey,
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
    );
  }
}

Future waitingDialog(context) {
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
            height: Get.height * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/wait.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Wait !!",
                  style: const TextStyle(
                      color: Color(0xff578A27),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                const Text(
                  "Let us check your insurance\ncoverage status.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
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

Future thankyouDialog(context) {
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
            height: Get.height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/thankyou.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Thank You! ",
                  style: const TextStyle(
                      color: Color(0xff578A27),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                const Text(
                  "A driver will be assigned for your location\nto pick up your vehicle.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Booking ID : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    ),
                    Text(
                      "XXXXX",
                      style: TextStyle(
                          color: Color(0xff578A27),
                          fontSize: 17,
                          fontFamily: "Roboto"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.05, vertical: Get.width * 0.08),
                  child: MyButton(
                      onpress: () {
                        Get.back();
                      },
                      btntext: "Ok"),
                ),
                SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

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

Future proceedDialog(context) {
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
            height: Get.height * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Image.asset(
                  "assets/images/insurance.png",
                  height: Get.width * 0.35,
                  width: Get.width * 0.35,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "You are under insurance coverage\nplease proceed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff8A8A8A),
                      fontSize: 14,
                      fontFamily: "Roboto"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.05, vertical: 10),
                  child: MyButton(onpress: () {}, btntext: "Proceed"),
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

class BuildTowingCard extends StatefulWidget {
  final name1;
  final name2;
  final name3;
  final icon1;
  final icon2;
  final icon3;
  const BuildTowingCard({
    Key? key,
    this.name1,
    this.name2,
    this.name3,
    this.icon1,
    this.icon2,
    this.icon3,
  }) : super(key: key);

  @override
  State<BuildTowingCard> createState() => _BuildTowingCardState();
}

class _BuildTowingCardState extends State<BuildTowingCard> {
  String isSelectCard = "Car Towing";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              isSelectCard = widget.name1;
              print(isSelectCard);
              print(widget.name1);
              print("object");
              setState(() {});
            },
            child: Container(
              height: Get.height * 0.1,
              width: Get.width * 0.26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelectCard == widget.name1
                      ? const Color(0xffCAFACC)
                      : const Color(0xffEAEAEA)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  SvgPicture.asset(
                    "assets/icons/${widget.icon1}.svg",
                    height: Get.width * 0.07,
                    width: Get.width * 0.07,
                    color: const Color(0xff818181),
                  ),
                  Text(
                    "${widget.name1}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: const Color(0xff818181), fontSize: 10.5),
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
            child: Container(
              height: Get.height * 0.1,
              // width: Get.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffEAEAEA)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  SvgPicture.asset(
                    "assets/icons/${widget.icon2}.svg",
                    height: Get.width * 0.07,
                    width: Get.width * 0.07,
                    color: const Color(0xff818181),
                  ),
                  Text(
                    "${widget.name2}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: const Color(0xff818181), fontSize: 10.5),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: Get.height * 0.1,
            width: Get.width * 0.26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffEAEAEA)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                SvgPicture.asset(
                  "assets/icons/${widget.icon3}.svg",
                  height: Get.width * 0.07,
                  width: Get.width * 0.07,
                  color: const Color(0xff818181),
                ),
                Text(
                  "${widget.name3}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: const Color(0xff818181), fontSize: 10.5),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
