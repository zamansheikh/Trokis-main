import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/custom_text_field.dart';
import 'package:trokis/presentations/screens/user/user_auth/otp_verify_screen.dart';
import 'package:trokis/presentations/screens/user/user_auth/signup_with_email_screen.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
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
                  text: "Sign In",
                  fontsize: 23,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),

                CustomTextField(hintText: "E-mail", prefixIcon: Icons.email),
                const SizedBox(height: 20),
                CustomTextField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    isPassword: true),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "Forgot Password?",
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                CustomButton(
                    onTap: () {
                      Get.to(() => OTPVerifyScreen());
                    },
                    text: "Sign In"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      fontsize: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpWithEmailScreen());
                      },
                      child: CustomText(
                        text: " Sign Up",
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
}
