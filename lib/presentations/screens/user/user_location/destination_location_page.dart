import 'package:file_picker/file_picker.dart';
import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/dropdown_form_field.dart';
import 'package:trokis/core/widgets/icon_form_field.dart';
import 'package:trokis/core/widgets/map_widget.dart';

class DestinationLocationPage extends StatefulWidget {
  const DestinationLocationPage({super.key});

  @override
  State<DestinationLocationPage> createState() =>
      _DestinationLocationPageState();
}

class _DestinationLocationPageState extends State<DestinationLocationPage> {
  List<String?> selectedFiles = [];

  void pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, // Enables multiple file selection
      );

      if (result != null) {
        // Get the file paths
        List<String?> files = result.paths;
        setState(() {
          selectedFiles = files;
        });
      }
    } catch (e) {
      debugPrint("File picking error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          "Destination Location",
          style: TextStyle(
            fontFamily: "Lora",
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                const SizedBox(
                  height: 10,
                ),
                MapWidget(
                  showPin: true,
                ),
                const SizedBox(height: 10),
                IconFormField(
                  hintText: 'Destination Location',
                  iconPath: "assets/icons/location.svg",
                ),
                DropdownFormField(
                  onChanged: (p0) {},
                  hintText: 'Location Type',
                  items: [
                    'House',
                    'Apartment',
                    'Office/Retail Space',
                    'Supermarket Chain/Mall',
                    'Farm House',
                    'Other'
                  ],
                ),
                DropdownFormField(
                  onChanged: (p0) {},
                  hintText: 'Floor Level',
                  items: [
                    'Ground Floor',
                    '1st Floor',
                    '2nd Floor',
                    '3rd Floor'
                  ],
                  iconPath: "assets/icons/arrow_updown.svg",
                ),
                DropdownFormField(
                  onChanged: (p0) {},
                  hintText: 'Is There An Elevator?',
                  items: [
                    'Freight Elevator',
                    'Normal Elevator',
                    'No Elevator',
                    'First Floor',
                    'Farm House',
                    'Stairs Are Wide',
                    'Stairs Narrow'
                  ],
                ),
                DropdownFormField(
                  onChanged: (p0) {},
                  hintText: 'Choose Parking Type',
                  items: ['Street', 'Garage', 'Driveway', 'Lot'],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.movingMapView);
                  },
                  isNetworkNeed: false,
                  text: "Next",
                  tailingIcon: "assets/icons/next.svg",
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
