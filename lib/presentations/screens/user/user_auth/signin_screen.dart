import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/custom_button_with_logo.dart';
import 'package:trokis/core/widgets/custom_phone_number_field.dart';
import 'package:trokis/core/widgets/minimal_button.dart';

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
                  width: 200,
                ),
                const SizedBox(height: 20),

                // Phone Number Input
                CustomPhoneNumberField(
                  hintText: "Enter Your Mobile Number",
                  controller: phoneController,
                ),
                const SizedBox(height: 20),

                // Continue Button
                CustomButtonWithLogo(
                  onTap: () {
                    //Show the bottom sheet,
                    bottomSheet(context);
                  },
                  text: "Continue",
                  height: 50,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 20),

                // Divider with "or"
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider()),
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
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                MinimalButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.signInWithEmail);
                  },
                  text: "Register as User",
                  height: 42,
                ),
                const SizedBox(height: 20),
                MinimalButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.signInWithEmail);
                  },
                  text: "Register as Driver",
                  height: 42,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
