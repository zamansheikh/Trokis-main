import 'package:flutter_svg/svg.dart';

import '../../controllers/network_connection.dart';
import '../exports/exports.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.color,
    this.textStyle,
    this.padding = EdgeInsets.zero,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
    this.height,
    this.isNetworkNeed = true,
    this.tailingIcon,
  });

  final Function() onTap;
  final String text;
  final bool loading;
  final bool? isNetworkNeed;
  final double? height;
  final double? width;
  final Color? color;
  final String? tailingIcon;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  final NetworkController networkController = Get.put(NetworkController());

  // A helper method to handle the button's onPressed logic
  void _handleOnPressed() {
    if (!networkController.isConnection.value) {
      ToastMessageHelper.showToastMessage("Please Connect your internet");
    } else if (!loading) {
      onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: isNetworkNeed == true ? _handleOnPressed : onTap,
        child: Stack(
          children: [
            Container(
              width: width ?? double.infinity,
              height: height ?? 50,
              decoration: BoxDecoration(
                  color: color ?? AppColors.primaryColor,
                  border: Border.all(
                    color: Color(
                      0x33333333,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: loading ? _buildLoadingIndicator() : _buildButtonText(),
              ),
            ),
            if (tailingIcon != null)
              Positioned(
                right: 24,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  tailingIcon!,
                  height: 24,
                  width: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 20.h,
      width: 20.h,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _buildButtonText() {
    return Text(
      text,
      style: textStyle ??
          TextStyle(
            fontFamily: "Lora",
            fontWeight: FontWeight.w400,
            color: color == null ? Colors.white : AppColors.primaryColor,
            fontSize: 18,
          ),
    );
  }
}
