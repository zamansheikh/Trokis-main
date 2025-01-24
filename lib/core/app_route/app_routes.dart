import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:trokis/presentations/screens/navbar/bottom_nav_bar.dart';
import 'package:trokis/presentations/screens/user/user_auth/otp_verify_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signin_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signup_screen.dart';
import 'package:trokis/presentations/screens/user/user_home/user_home_screen.dart';
import 'package:trokis/presentations/screens/user/user_location/destination_location_page.dart';
import 'package:trokis/presentations/screens/user/user_location/starting_location_page.dart';
import '../../presentations/screens/onboarding/onboard_screen.dart';
import '../../presentations/screens/splash/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String onboardScreen = "/OnboardScreen";
  static String signUpScreen = "/signup_screen";
  static String signinScreen = "/signin_screen";
  static String signInWithEmail = "/sign_in_with_email";
  static String otpVerifyScreen = "/otp_verify_screen";
  static String userHomeScreen = "/userHomeScreen";
  static String bottomNavBar = "/bottomNavBar";
  static String movingStartingLocation = "/moving/starting_location";
  static String movingDestinationLocation = "/moving/destination_location";

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardScreen()),
    GetPage(name: signUpScreen, page: () => const SignupScreen()),
    GetPage(name: signinScreen, page: () => const SigninScreen()),
    GetPage(name: otpVerifyScreen, page: () => const OTPVerifyScreen()),
    GetPage(name: userHomeScreen, page: () => const UserHomeScreen()),
    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),
    GetPage(name: movingStartingLocation, page: ()=> const StartingLocationPage()),
    GetPage(name: movingDestinationLocation, page: ()=> const DestinationLocationPage()),
  ];
}
