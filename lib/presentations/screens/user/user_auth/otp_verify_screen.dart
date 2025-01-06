import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/minimal_button.dart';
import 'package:trokis/presentations/screens/user/user_home/user_home_screen.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController otpController = TextEditingController();

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
                  text: "Verify Email",
                  fontsize: 23,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text:
                      "Please enter the OTP code, \nWe’ve sent you in your mail.",
                  fontsize: 15,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  fieldHeight: 42,
                  fieldWidth: 42,
                  decoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(42.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(42.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),

                  numberOfFields: 6,
                  hasCustomInputDecoration: true,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: false,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                const SizedBox(height: 20),

                CustomButton(
                  onTap: () {
                    Get.to(() => UserHomeScreen());
                  },
                  text: "Verify",
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
