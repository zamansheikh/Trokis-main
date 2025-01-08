import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_location/item_details_page.dart';

class DestinationLocationPage extends StatefulWidget {
  const DestinationLocationPage({super.key});

  @override
  State<DestinationLocationPage> createState() =>
      _DestinationLocationPageState();
}

class _DestinationLocationPageState extends State<DestinationLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: CustomText(
          text: "Destination Location",
          fontsize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            IconFormField(
              hintText: 'Starting Location',
              icon: Icons.location_on_outlined,
            ),

            // Dropdown Form Fields
            DropdownFormField(
              onChanged: (p0) {},
              hintText: 'Location Type',
              items: ['House', 'Apartment', 'Office', 'Other'],
            ),
            DropdownFormField(
              onChanged: (p0) {},
              hintText: 'Floor Level',
              items: ['Ground Floor', '1st Floor', '2nd Floor', '3rd Floor'],
            ),
            DropdownFormField(
              onChanged: (p0) {},
              hintText: 'Is There An Elevator?',
              items: ['Yes', 'No'],
            ),
            DropdownFormField(
              onChanged: (p0) {},
              hintText: 'Choose Parking Type',
              items: ['Street', 'Garage', 'Driveway', 'Lot'],
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Get.to(() => ItemDetailsPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, size: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Form Field with Icon
class IconFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const IconFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          suffixIcon: Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

// Custom Dropdown Form Field
class DropdownFormField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;

  const DropdownFormField({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(
          hintText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
