import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trokis/presentations/screens/user/user_moving/driver_info_widget.dart';
import 'package:trokis/presentations/screens/user/user_moving/map_view_widget.dart';

class UserTripUpdateScreen extends StatefulWidget {
  const UserTripUpdateScreen({super.key});

  @override
  State<UserTripUpdateScreen> createState() => _UserTripUpdateScreenState();
}

class _UserTripUpdateScreenState extends State<UserTripUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Update'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Illustration
            SizedBox(
              height: 300, // Adjust the height as needed
              child: MapViewWidget(
                startLocation: LatLng(23.753939, 90.425292),
                destinationLocation: LatLng(23.8103, 90.4125),
                initialDriverLocation: LatLng(23.7806, 90.4225),
              ),
            ),

            // Driver Information Section
            const DriverInfoWidget(),
          ],
        ),
      ),
    );
  }
}
