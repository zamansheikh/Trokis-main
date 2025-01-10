import 'package:trokis/core/exports/exports.dart';
import '../../../core/app_route/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jump();
    super.initState();
  }

  jump() async {
    Future.delayed(const Duration(seconds: 3), () async {
      // var token = await PrefsHelper.getString(AppConstants.bearerToken);
      // bool isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
      // if(isLogged){
      //   if(token.isNotEmpty){
      //     Get.offAllNamed(AppRoutes.bottomNavBar);
      //   }
      // }else{
      Get.offAllNamed(AppRoutes.onboardScreen);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.appLogo.image(height: 345.h, width: 345.w),
          ],
        ),
      ),
    ));
  }
}
