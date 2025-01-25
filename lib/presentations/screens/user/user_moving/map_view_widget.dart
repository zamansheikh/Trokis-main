import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:trokis/core/exports/exports.dart';
import 'dart:convert';
import 'package:trokis/core/utils/logger.dart';
import 'package:trokis/core/utils/marker_utils.dart';
import 'package:trokis/presentations/screens/user/user_moving/complete_request_screen.dart';
import 'package:trokis/presentations/screens/user/user_moving/driver_info_widget.dart';

class MapViewWidget extends StatefulWidget {
  final LatLng startLocation;
  final LatLng destinationLocation;
  final LatLng initialDriverLocation;

  const MapViewWidget({
    super.key,
    required this.startLocation,
    required this.destinationLocation,
    required this.initialDriverLocation,
  });

  @override
  State<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends State<MapViewWidget> {
  late GoogleMapController _mapController;
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  LatLng? _currentDriverLocation;
  Timer? _timer;
  String apiKey = dotenv.env['MAP_API_KEY']!;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  void customMarker() async {
    final image =
        await MarkerUtils.loadImageFromAssets('assets/images/map_marker.png');
    await MarkerUtils.createBitmapDescriptor(
      // image: image,
      iconData: Icons.directions_car,
    ).then((icon) {
      setState(() {
        customIcon = icon;
      });
    });
  }

  String? _deliveryStatus = '1';

  //List OF DeliveryStatus
  Map<String, String> deliveryStatus = {
    '1': 'Order Placed',
    '2': 'Order Accepted',
    '3': 'Order Picked',
    '4': 'Order Delivered',
  };

  void upDateChild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentDriverLocation = widget.initialDriverLocation;
    _addMarkers();
    _fetchRoute();
    customMarker();

    // Add Timer and Update the Delivery Status every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_deliveryStatus == '4') {
        timer.cancel();
      } else {
        if (mounted) {
          setState(() {
            _deliveryStatus = (int.parse(_deliveryStatus!) + 1).toString();
          });
          _updateDriverLocation(LatLng(
            _currentDriverLocation!.latitude + 0.011,
            _currentDriverLocation!.longitude + 0.011,
          ));
          debugPrint('Delivery Status Updated to $_deliveryStatus');
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _addMarkers() {
    _markers.add(Marker(
      markerId: const MarkerId('start'),
      position: widget.startLocation,
      infoWindow: const InfoWindow(title: 'Start Location'),
    ));
    _markers.add(Marker(
      markerId: const MarkerId('destination'),
      position: widget.destinationLocation,
      infoWindow: const InfoWindow(title: 'Destination Location'),
    ));
    _updateDriverMarker();
  }

  void _updateDriverMarker() {
    if (_currentDriverLocation != null) {
      _markers.removeWhere((marker) => marker.markerId.value == 'driver');
      _markers.add(Marker(
        markerId: const MarkerId('driver'),
        position: _currentDriverLocation!,
        // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        icon: customIcon,
        infoWindow: const InfoWindow(
            title: 'Driver Location', snippet: 'Driver is here'),
      ));
    }
  }

  Future<void> _fetchRoute() async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${widget.startLocation.latitude},${widget.startLocation.longitude}&destination=${widget.destinationLocation.latitude},${widget.destinationLocation.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String encodedPoints =
          data['routes'][0]['overview_polyline']['points'];
      final List<LatLng> polylineCoordinates = _decodePolyline(encodedPoints);

      setState(() {
        _polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          points: polylineCoordinates,
          color: Colors.blue,
          width: 5,
        ));
      });
    } else {
      debugPrint('Failed to fetch route');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polyline.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }

    return polyline;
  }

  void _updateDriverLocation(LatLng newLocation) {
    setState(() {
      _currentDriverLocation = newLocation;
      _updateDriverMarker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          //Back Button and APP bar
          Container(
            height: 80,
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: CustomText(
                      text: deliveryStatus[_deliveryStatus!].toString(),
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.startLocation,
                zoom: 12,
              ),
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (controller) {
                _mapController = controller;
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                AppLogger.d('Driver Information Clicked');
                // Open the driver information screen
                Get.to(
                  () => CompleteRequestScreen(),
                );
              },
              child: DriverInfoWidget(
                status: deliveryStatus[_deliveryStatus!].toString(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Simulate driver movement
              _updateDriverLocation(LatLng(
                _currentDriverLocation!.latitude + 0.001,
                _currentDriverLocation!.longitude + 0.001,
              ));
            },
            child: const Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
