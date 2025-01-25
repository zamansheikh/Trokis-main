import 'package:flutter/widgets.dart';
import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/map_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Map",
          style: TextStyle(
            fontFamily: "Lora",
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: MapWidget(
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              bottom: 6,
              child: CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.movingItemDetails);
                },
                text: "Next",
                tailingIcon: "assets/icons/next.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
