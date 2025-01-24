import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class DropdownFormField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? iconPath;
  final String? value;
  final Function(String?)? onChanged;

  const DropdownFormField({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: AppColors.backgroundColor,
        icon: SvgPicture.asset(iconPath ?? "assets/icons/arrow_down.svg"),
        hint: Text(
          hintText,
          style: const TextStyle(
            fontFamily: "Lora",
            color: Color(0xff545454),
            fontSize: 14,
          ),
        ),
        decoration: InputDecoration(
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
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontFamily: "Lora",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
