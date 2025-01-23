import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';

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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontFamily: "Lora",
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 200,
                  width: 220,
                ),
                const SizedBox(height: 24),
                Text(
                  "Verify Number",
                  style: TextStyle(
                      fontFamily: "Lora",
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF333333)),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please enter the OTP code, We’ve sent you in your Number.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Lora",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF333333)),
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  fieldHeight: 50,
                  fieldWidth: 50,
                  textStyle: TextStyle(
                    fontFamily: "Lora",
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(99.0),
                      borderSide: const BorderSide(color: Color(0xff8a8a8a)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(99.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),

                  numberOfFields: 6,
                  hasCustomInputDecoration: true,
                  showFieldAsBox: false,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                  }, // end onSubmit
                ),
                const SizedBox(height: 24),

                CustomButton(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.bottomNavBar);
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
