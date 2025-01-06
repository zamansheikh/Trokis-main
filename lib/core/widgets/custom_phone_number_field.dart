import 'package:flutter/material.dart';

class CustomPhoneNumberField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomPhoneNumberField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.phone,
  });

  @override
  CustomPhoneNumberFieldState createState() => CustomPhoneNumberFieldState();
}

class CustomPhoneNumberFieldState extends State<CustomPhoneNumberField> {
  String selectedCountryCode = '+880'; // Default country code (Bangladesh)
  String selectedFlag = 'assets/flag/bd_flag.png'; // Default flag image

  final List<Map<String, String>> countries = [
    {'code': '+1', 'flag': 'assets/flag/us_flag.png'},
    {'code': '+91', 'flag': 'assets/flag/in_flag.png'},
    {'code': '+44', 'flag': 'assets/flag/uk_flag.png'},
    {'code': '+880', 'flag': 'assets/flag/bd_flag.png'},
    {'code': '+61', 'flag': 'assets/flag/aus_flag.png'},
    {'code': '+81', 'flag': 'assets/flag/jp_flag.png'},
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountryCode,
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country['code'],
                  child: Row(
                    children: [
                      Image.asset(
                        country['flag']!,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(country['code']!),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountryCode = value!;
                  selectedFlag = countries.firstWhere(
                      (country) => country['code'] == value)['flag']!;
                });
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
