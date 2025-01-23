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
  List<Widget> pages = [
    UserHomeScreen(),
    UserService(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pages[_selectedIndex % pages.length],
            Positioned(
              bottom: 30,
              left: 24,
              right: 24,
              child: CustomBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
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
      height: 65,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          _buildNavItem(
            iconPath: "assets/icons/nav_home.svg",
            label: "Home",
            index: 0,
          ),
          _buildNavItem(
            iconPath: "assets/icons/nav5.svg",
            label: "Service",
            index: 1,
          ),
          _buildNavItem(
            iconPath: "assets/icons/nav4.svg",
            label: "Chat",
            index: 2,
          ),
          _buildNavItem(
            iconPath: "assets/icons/nav3.svg",
            label: "Activity",
            index: 3,
          ),
          _buildNavItem(
            iconPath: "assets/icons/nav2.svg",
            label: "Profile",
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
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
