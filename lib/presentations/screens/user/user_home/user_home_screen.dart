import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    "assets/images/app_logo.png",
                    height: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    "assets/images/welcome_map.jpg",
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Center(
                    child: CustomText(
                      textOverflow: TextOverflow.visible,
                      text: "Welcome to Trokis",
                      fontsize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 1,
        onTap: (p0) {},
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.all(16), // Margin from screen edges
      padding: const EdgeInsets.symmetric(vertical: 10), // Inner padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavSelectedItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Home",
            isLabelHidden: true,
            index: 0,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Search",
            isLabelHidden: true,
            index: 1,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Add",
            isLabelHidden: true,
            index: 2,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Favorite",
            isLabelHidden: true,
            index: 3,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Profile",
            isLabelHidden: true,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required int index,
    bool isLabelHidden = false,
  }) {
    final bool isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(),
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.blue : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            if (!isLabelHidden)
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavSelectedItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required int index,
    bool isLabelHidden = false,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.blue : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            if (!isLabelHidden)
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
