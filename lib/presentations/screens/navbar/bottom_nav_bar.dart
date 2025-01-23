import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_home/user_home_screen.dart';
import 'package:trokis/presentations/screens/user/user_service/user_service.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // UserHomeScreen(),
          UserService(),
          // UserAddScreen(),
          // UserFavoriteScreen(),
          // UserProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: 24), // Margin from screen edges
        // padding: const EdgeInsets.symmetric(vertical: 10), // Inner padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              iconPath: "assets/icons/nav_home.svg",
              label: "Home",
              isLabelHidden: true,
              index: 0,
            ),
            _buildNavItem(
              context,
              iconPath: "assets/icons/nav5.svg",
              label: "Profile",
              isLabelHidden: true,
              index: 1,
            ),
            _buildNavItem(
              context,
              iconPath: "assets/icons/nav4.svg",
              label: "Favorite",
              isLabelHidden: true,
              index: 2,
            ),
            _buildNavItem(
              context,
              iconPath: "assets/icons/nav3.svg",
              label: "Add",
              isLabelHidden: true,
              index: 3,
            ),
            _buildNavItem(
              context,
              iconPath: "assets/icons/nav2.svg",
              label: "Search",
              isLabelHidden: true,
              index: 4,
            ),
          ],
        ),
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
    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  color: index == selectedIndex ? Colors.black : Colors.white,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lora",
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
