import 'package:file_picker/file_picker.dart';
import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/dropdown_form_field.dart';
import 'package:trokis/core/widgets/icon_form_field.dart';
import 'package:trokis/core/widgets/map_widget.dart';

class StartingLocationPage extends StatefulWidget {
  const StartingLocationPage({super.key});

  @override
  State<StartingLocationPage> createState() => _StartingLocationPageState();
}

class _StartingLocationPageState extends State<StartingLocationPage> {
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
      print("File picking error: $e");
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
          "Starting Location",
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
                  hintText: 'Starting Location',
                  iconPath: "assets/icons/location.svg",
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconFormField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                          );
                        },
                        hintText: 'Select Date',
                        iconPath: "assets/icons/callender.svg",
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: IconFormField(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        hintText: 'Time',
                        iconPath: "assets/icons/time.svg",
                      ),
                    ),
                  ],
                ),
                // Dropdown Form Fields
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

                IconFormField(
                  hintText: selectedFiles.isEmpty
                      ? 'Upload Video'
                      : selectedFiles[0]!.split('/').last,
                  iconPath: "assets/icons/file.svg",
                  onTap: () {
                    pickFiles();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.movingDestinationLocation);
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
