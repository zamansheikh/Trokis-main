import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                "assets/images/app_logo.png",
                height: 200,
                width: 220,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.signinScreen);
              },
              text: "Login",
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              onTap: () {},
              text: "Use as Guest",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
