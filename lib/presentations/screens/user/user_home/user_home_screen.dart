import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 70,
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/notification.svg"),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/map.png",
                          fit: BoxFit.fitHeight,
                          height: MediaQuery.of(context).size.height * 0.58,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _drawIconBox(
                            iconPath: "assets/icons/moving.svg",
                            name: "Moving",
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _drawIconBox(
                            iconPath: "assets/icons/big_item.svg",
                            name: "Big Item",
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _drawIconBox(
                            iconPath: "assets/icons/errand.svg",
                            name: "Errand",
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawIconBox({
    required String iconPath,
    required String name,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Color(0xff333333),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: TextStyle(fontFamily: "Lora", fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
