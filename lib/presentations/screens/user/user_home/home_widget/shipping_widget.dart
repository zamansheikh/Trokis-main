import 'package:flutter/material.dart';
import 'package:trokis/core/widgets/custom_text.dart';

class ShippingCard extends StatelessWidget {
  final String from;
  final String to;
  final String status;
  const ShippingCard({
    super.key,
    required this.from,
    required this.to,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: 15,
          child: Row(
            children: [
              Icon(
                Icons.car_crash,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              CustomText(
                text: status,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          right: 15,
          child: Container(
            height: 100,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Pickup",
                        fontsize: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: from,
                        fontsize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Address",
                        fontsize: 14,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: to,
                        fontsize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
