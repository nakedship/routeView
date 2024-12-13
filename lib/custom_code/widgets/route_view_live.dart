// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math' show cos, sqrt, asin;

class RouteViewLive extends StatefulWidget {
  const RouteViewLive({
    Key? key,
    this.width,
    this.height,
    required this.orderId, // Use orderId instead of Firestore reference
    required this.updateInterval,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    this.lineColor = Colors.black,
  }) : super(key: key);

  final double? height;
  final double? width;
  final int updateInterval;
  final Color lineColor;
  final int orderId; // Supabase order ID
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;

  @override
  _RouteViewLiveState createState() => _RouteViewLiveState();
}

class _RouteViewLiveState extends State<RouteViewLive> {
  Timer? _timer;
  late CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> initialPolylines = {};
  Map<String, dynamic>? orderData; // Store order details

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  // Fetch order details from Supabase
  Future<void> fetchOrderDetails() async {
    final response = await Supabase.instance.client
        .from('orders')
        .select()
        .eq('id', widget.orderId)
        .single();

    if (response.error != null) {
      log('Failed to fetch order details: ${response.error!.message}');
      return;
    }

    setState(() {
      orderData = response.data;
    });

    if (orderData != null) {
      final pickupLat =
          (orderData!['pickup_location_latlon_json']['latitude'] as num)
              .toDouble();
      final pickupLng =
          (orderData!['pickup_location_latlon_json']['longitude'] as num)
              .toDouble();

      _initialLocation = CameraPosition(
        target: LatLng(pickupLat, pickupLng),
        zoom: 14,
      );

      initPolylines();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

  // Create the polylines for showing the route between two places
  Future<Tuple2<Map<PolylineId, Polyline>, List<latlng.LatLng>>>
      _createPolylines(double startLatitude, double startLongitude,
          double destinationLatitude, double destinationLongitude) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    List<latlng.LatLng> polylineCoordinates = [];

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: widget.lineColor,
      points: polylineCoordinates,
      width: 3,
    );

    return Tuple2({id: polyline}, polylineCoordinates);
  }

  initPolylines() async {
    if (orderData != null) {
      final startLatitude =
          (orderData!['pickup_location_latlon_json']['latitude'] as num)
              .toDouble();
      final startLongitude =
          (orderData!['pickup_location_latlon_json']['longitude'] as num)
              .toDouble();
      final destinationLatitude =
          (orderData!['dropoff_location_latlon_json']['latitude'] as num)
              .toDouble();
      final destinationLongitude =
          (orderData!['dropoff_location_latlon_json']['longitude'] as num)
              .toDouble();

      final initPolylines = await _createPolylines(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );
      if (initPolylines != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            initialPolylines = initPolylines.item1;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (orderData == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: widget.height,
      width: widget.width,
      child: GoogleMap(
        markers: Set<Marker>.from(markers),
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: Set<Polyline>.of(initialPolylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}
