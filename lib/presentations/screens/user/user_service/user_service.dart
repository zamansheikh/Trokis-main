import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_location/starting_location_page.dart';
import 'package:trokis/presentations/screens/user/user_service/widgets/video_player.dart';

class UserService extends StatefulWidget {
  const UserService({super.key});

  @override
  State<UserService> createState() => _UserServiceState();
}

class _UserServiceState extends State<UserService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InfiniteVideoPlayer(
              videoPath: "assets/video/SampleVideo_1280x720_2mb.mp4",
              playFromAsset: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 200,
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomText(
                    text: "Moving And Errands Stress Free",
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildServiceCard(
                          onTap: () {},
                          icon: "assets/icons/moving.svg",
                          title: "Moving",
                        ),
                        const SizedBox(width: 10),
                        _buildServiceCard(
                          onTap: () {
                            Get.to(() => StartingLocationPage());
                          },
                          icon: "assets/icons/big_item.svg",
                          title: "Big Item",
                        ),
                        const SizedBox(width: 10),
                        _buildServiceCard(
                          onTap: () {},
                          icon: "assets/icons/errand.svg",
                          title: "Errand",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
      {required String icon,
      required String title,
      required GestureTapCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.withValues(alpha: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 30,
              ),
              const SizedBox(height: 8), // Added some spacing
              CustomText(
                text: title,
                fontsize: 16, // Reduced font size for better fit
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
