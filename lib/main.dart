import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restowcustomer/Screens/CompleteJob/complete_job.dart';
import 'package:restowcustomer/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restowcustomer/Screens/Home/home_screen.dart';
import 'package:restowcustomer/Screens/PendingUpcomingRequest/pending_upcoming_request.dart';
import 'package:restowcustomer/Screens/VehicleTow/vehicle_tow.dart';
import 'package:restowcustomer/Screens/VerifyOtp/verify_otp.dart';

import 'Constants/colors.dart';
import 'Routes/app.routes.dart';
import 'Screens/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Restow',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: background,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
