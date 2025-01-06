import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/custom_text_field.dart';
import 'package:trokis/core/widgets/minimal_button.dart';
import 'package:trokis/presentations/screens/user/user_auth/otp_verify_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signin_with_email_screen.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({super.key});

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
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
                CustomText(
                  text: "Sign Up",
                  fontsize: 23,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: "Name", prefixIcon: Icons.people),
                const SizedBox(height: 20),
                CustomTextField(hintText: "E-mail", prefixIcon: Icons.email),
                const SizedBox(height: 20),
                //phone
                CustomTextField(hintText: "Phone", prefixIcon: Icons.phone),
                const SizedBox(height: 20),

                CustomTextField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    isPassword: true),
                const SizedBox(height: 20),
                CustomTextField(
                    isPassword: true,
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock),

                const SizedBox(height: 20),

                CustomButton(
                    onTap: () {
                      Get.to(() => OTPVerifyScreen());
                    },
                    text: "Sign Up"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account?",
                      fontsize: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignInWithEmailScreen());
                      },
                      child: CustomText(
                        text: " Sign In",
                        fontsize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
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
                  onTap: () {},
                  text: "Register as User",
                  height: 42,
                ),
                const SizedBox(height: 20),
                MinimalButton(
                  onTap: () {},
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
