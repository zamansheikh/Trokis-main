import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/custom_text.dart';

class GetPriceScreen extends StatefulWidget {
  const GetPriceScreen({super.key});

  @override
  State<GetPriceScreen> createState() => _GetPriceScreenState();
}

class _GetPriceScreenState extends State<GetPriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text('Get Price'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "The Estimate Price for\nthis Moving is:",
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: "\$ 700",
                      fontsize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/thank_you.png',
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: "You will receive quotes within the next minutes.",
                textOverflow: TextOverflow.visible,
                fontsize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              CustomButton(onTap: () {}, text: "Back to Home"),
            ],
          ),
        ));
  }
}
