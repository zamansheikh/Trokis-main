import 'package:flutter/material.dart';

class CustomButtonWithLogo extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final IconData? icon;
  final bool isAsset;
  final String? assetPath;

  const CustomButtonWithLogo({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.height = 50,
    this.icon,
    this.isAsset = false,
    this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Color(0xffe6e6e6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isAsset && assetPath != null)
              Image.asset(assetPath!, height: 24, width: 24),
            if (!isAsset && icon != null) Icon(icon, color: textColor),
            if ((isAsset && assetPath != null) || icon != null)
              const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: "Lora",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
