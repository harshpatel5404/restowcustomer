import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';

class RatingReviewScreen extends StatefulWidget {
  RatingReviewScreen({Key? key}) : super(key: key);

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController descController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  "Rating & Review",
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
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: Get.width * 0.2,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/profile.png',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: kPrimaryColor.withOpacity(0.4),
                        width: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " John doe",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        " Booking Id : 25511511",
                        style: TextStyle(
                          color: Color(0xffA8A8A8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.width * 0.06),
                child: Center(
                  child: RatingBar(
                    initialRating: 4,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: Get.width * 0.1,
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
                      ),
                      half: SizedBox(),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                  key: formkey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: descController,
                      maxLines: 5,
                      cursorColor: Colors.black,
                      style: const TextStyle(
                          fontSize: 17, color: const Color(0xffC3C3C3)),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontSize: 17, color: const Color(0xffC3C3C3)),
                        hintText: 'Comments..',
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
                        contentPadding: EdgeInsets.all(Get.width * 0.05),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(19.0),
          child: MyButton(onpress: () {}, btntext: "Submit"),
        ),
      ),
    );
  }
}
