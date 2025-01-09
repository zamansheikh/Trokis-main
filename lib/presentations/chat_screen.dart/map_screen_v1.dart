import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:trokis/presentations/chat_screen.dart/geolocator.dart';

class OpenMapsScreen extends StatefulWidget {
  const OpenMapsScreen({super.key, required this.sellerLocation});

  final LatLng sellerLocation;

  @override
  State<OpenMapsScreen> createState() => _OpenMapsScreenState();
}

class _OpenMapsScreenState extends State<OpenMapsScreen> {
  LatLng? _currentLocation;

  // Simulating fetching the user's current location
  Future<void> _getCurrentLocation() async {
    Position? position = await determinePosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Your Location'),
      ),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: widget.sellerLocation,
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(
                      markers: [
                        // User's location marker
                        Marker(
                          point: _currentLocation!,
                          child: const Icon(Icons.location_pin,
                              color: Colors.blue),
                        ),
                        // Seller's location marker
                        Marker(
                          point: widget.sellerLocation,
                          child: const Icon(Icons.location_pin,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [_currentLocation!, widget.sellerLocation],
                          strokeWidth: 4.0,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      // Send the user's current location to the seller
                      Navigator.pop(context, _currentLocation);
                    },
                    child: const Text('Send My Location'),
                  ),
                ),
              ],
            ),
    );
  }
}
