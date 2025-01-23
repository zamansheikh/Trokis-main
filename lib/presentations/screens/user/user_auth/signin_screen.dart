import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/custom_button_with_logo.dart';
import 'package:trokis/core/widgets/custom_phone_number_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 200,
                  width: 220,
                ),
                const SizedBox(height: 20),

                // Phone Number Input
                CustomPhoneNumberField(
                  // hintText: "Enter Your Mobile Number",
                  controller: phoneController,
                ),
                const SizedBox(height: 20),

                // Continue Button
                CustomButton(
                  onTap: () {
                    //Show the bottom sheet,
                    bottomSheet(context);
                  },
                  text: "Continue",
                ),
                const SizedBox(height: 20),

                // Divider with "or"
                Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      color: Color(0xff545454),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or",
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff545454)),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Color(0xff545454),
                    )),
                  ],
                ),
                const SizedBox(height: 20),

                // Social Login Buttons
                CustomButtonWithLogo(
                  isAsset: true,
                  assetPath: "assets/images/google_logo.png",
                  onTap: () {
                    // Handle Google login
                  },
                  text: "Continue with Google",
                  height: 50,
                  backgroundColor: Colors.grey.shade300,
                  textColor: Colors.black,
                  icon: Icons.face,
                ),
                const SizedBox(height: 10),

                CustomButtonWithLogo(
                  isAsset: true,
                  assetPath: "assets/images/facebook_logo.png",
                  onTap: () {
                    // Handle Facebook login
                  },
                  text: "Continue with Facebook",
                  height: 50,
                  backgroundColor: Colors.grey.shade300,
                  textColor: Colors.black,
                  icon: Icons.facebook,
                ),
                const SizedBox(height: 10),

                CustomButtonWithLogo(
                  onTap: () {
                    // Handle Email login
                  },
                  text: "Continue with Email",
                  height: 50,
                  backgroundColor: Colors.grey.shade300,
                  textColor: Colors.black,
                  icon: Icons.email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 225,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.otpVerifyScreen);
                  },
                  text: "Register as User",
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.otpVerifyScreen);
                  },
                  text: "Register as Driver",
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
