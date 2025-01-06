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
  });

  final Function() onTap;
  final String text;
  final bool loading;
  final bool? isNetworkNeed;
  final double? height;
  final double? width;
  final Color? color;
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
      child: ElevatedButton(
        onPressed: isNetworkNeed == true ? _handleOnPressed : onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          backgroundColor: color ?? AppColors.primaryColor,
          minimumSize: Size(width ?? Get.width, height ?? 48.h),
        ),
        child: loading
            ? _buildLoadingIndicator()
            : _buildButtonText(),
      ),
    );
  }

  // Method for the loading indicator
  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 20.h,
      width: 20.h,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  // Method to build the button text
  Widget _buildButtonText() {
    return Text(
      text,
      style: textStyle ?? const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontFamily: "Lore"),
    );
  }
}
