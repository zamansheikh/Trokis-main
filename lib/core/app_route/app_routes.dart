import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:trokis/presentations/screens/navbar/bottom_nav_bar.dart';
import 'package:trokis/presentations/screens/user/user_auth/otp_verify_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signin_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signin_with_email_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signup_screen.dart';
import 'package:trokis/presentations/screens/user/user_home/user_home_screen.dart';
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

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => OnboardScreen()),
    GetPage(name: signUpScreen, page: () => SignupScreen()),
    GetPage(name: signinScreen, page: () => SigninScreen()),
    GetPage(name: signInWithEmail, page: () => SignInWithEmailScreen()),
    GetPage(name: otpVerifyScreen, page: () => OTPVerifyScreen()),
    GetPage(name: userHomeScreen, page: () => UserHomeScreen()),
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),
  ];
}
