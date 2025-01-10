import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_moving/driver_info_widget.dart';
import 'package:trokis/presentations/screens/user/user_moving/map_view_widget.dart';

class DriverInformationScreen extends StatelessWidget {
  const DriverInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Driver Information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Illustration
            Image.asset(
              'assets/images/confirm.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            // Driver Information Section
            InkWell(
                onTap: () => Get.to(
                      () => MapViewWidget(
                        startLocation: LatLng(23.753939, 90.425292),
                        destinationLocation: LatLng(23.8103, 90.4125),
                        initialDriverLocation: LatLng(23.7806, 90.4225),
                      ),
                    ),
                child: DriverInfoWidget()),
          ],
        ),
      ),
    );
  }
}
