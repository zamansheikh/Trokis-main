import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class IconFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final String? iconPath;
  final VoidCallback? onTap;
  final bool isDisabled;
  final TextEditingController? controller;

  const IconFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.onTap,
    this.controller,
    this.iconPath,
    this.isDisabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          enabled: !isDisabled,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: "Lora",
              color: Color(0xff545454),
              fontSize: 14,
            ),
            suffixIcon: iconPath == null
                ? Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: SvgPicture.asset(
                      iconPath!,
                    ),
                  ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 0.5,
                color: Color(0xff8A8A8A),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
