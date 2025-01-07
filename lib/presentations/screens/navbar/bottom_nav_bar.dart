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
          UserHomeScreen(),
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
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav1.svg",
            label: "Home",
            isLabelHidden: true,
            index: 0,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav2.svg",
            label: "Search",
            isLabelHidden: true,
            index: 1,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav3.svg",
            label: "Add",
            isLabelHidden: true,
            index: 2,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav4.svg",
            label: "Favorite",
            isLabelHidden: true,
            index: 3,
          ),
          _buildNavItem(
            context,
            iconPath: "assets/icons/nav5.svg",
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
    if (!isSelected) {
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
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      );
    } else {
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
                  isSelected ? Colors.black : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 4),
              if (!isLabelHidden)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      );
    }
  }
}
