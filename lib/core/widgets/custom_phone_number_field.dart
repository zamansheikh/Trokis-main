import 'package:flutter/material.dart';

class CustomPhoneNumberField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomPhoneNumberField({
    super.key,
    this.hintText,
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
        border: Border.all(color: Color(0xff545454)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountryCode,
              icon: Container(),
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
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                        color: Color.fromARGB(197, 51, 51, 51),
                      ),
                      // const SizedBox(width: 8),
                      Text(
                        country['code']!,
                        style: TextStyle(
                          fontFamily: "Lora",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                      ),
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
