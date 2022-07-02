import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:restowcustomer/Screens/Accept/accept_screen.dart';
import 'package:restowcustomer/Screens/ChangePassword/change_password.dart';
import 'package:restowcustomer/Screens/ForgotPassword/forgotpassword.dart';
import 'package:restowcustomer/Screens/Home/home_screen.dart';
import 'package:restowcustomer/Screens/Notifications/notifications.dart';
import 'package:restowcustomer/Screens/PendingUpcomingRequest/pending_upcoming_request.dart';
import 'package:restowcustomer/Screens/Profile/edit_profile.dart';
import 'package:restowcustomer/Screens/Profile/profile_screen.dart';
import 'package:restowcustomer/Screens/SignIn/sign_in_screen.dart';
import 'package:restowcustomer/Screens/SignUp/sign_up_screen.dart';
import 'package:restowcustomer/Screens/Splash/splash_screen.dart';
import 'package:restowcustomer/Screens/StartJob/startjob_screen.dart';

import '../Screens/CompleteJob/complete_job.dart';
import '../Screens/Rating Review/rating_review.dart';
import '../Screens/VerifyOtp/verify_otp.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/signin', page: () => SignInPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
    GetPage(name: '/verifyotp', page: () => VerifyOtp()),
    GetPage(name: '/forgotpassword', page: () => ForgotPassword()),
    GetPage(name: '/changepassword', page: () => ChangePassword()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/accept', page: () => const AcceptScreen()),
    GetPage(name: '/startjob', page: () => const StartJobScreen()),
    GetPage(name: '/completejob', page: () => const CompleteJobScreen()),
    GetPage(name: '/notification', page: () => Notifications()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/ratingreview', page: () => RatingReviewScreen()),
  ];
}
