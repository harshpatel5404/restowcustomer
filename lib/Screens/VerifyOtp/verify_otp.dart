import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Home/home_screen.dart';
import 'package:restowcustomer/Screens/SignUp/sign_up_screen.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';

class VerifyOtp extends StatefulWidget {
  VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  OtpFieldController otpFieldController = OtpFieldController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String otp = "";
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.width * 0.04),
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
                    "Verify",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Center(
              child: Image.asset(
                "assets/images/verify.png",
                height: Get.height * 0.2,
                width: Get.height * 0.15,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "Verification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              "Code has been sent to your mail/mobile",
              style: TextStyle(
                color: Color(0xff959595),
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(Get.width * 0.04),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(children: [
                  OTPTextField(
                      controller: otpFieldController,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: Get.width * 0.15,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 5,
                      style: TextStyle(
                          fontSize: 17,
                          color: textcolor,
                          fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.04,
                          vertical: Get.width * 0.04),
                      otpFieldStyle: OtpFieldStyle(
                        borderColor: textcolor,
                        focusBorderColor: textcolor,
                        enabledBorderColor: Color(0xff212121),
                        disabledBorderColor: Colors.black38,
                      ),
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        setState(() {
                          otp = pin;
                        });
                      }),
                ]),
              ),
            ),
            SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1, vertical: Get.width * 0.05),
              child: MyButton(
                btntext: "Submit",
                onpress: () {
                  Get.off(HomeScreen());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If OTP code is not received?  ",
                  style: TextStyle(
                    color: Color(0xff515050),
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(SignUpPage());
                  },
                  child: Text(
                    "Resend",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
