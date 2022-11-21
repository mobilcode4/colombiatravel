import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class Map extends StatelessWidget {
  String lat;
  String long;
  String zoom;
  String ciudad;
  Map(this.lat, this.long, this.zoom, this.ciudad, {super.key});

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(double.parse(lat), double.parse(long)),
      zoom: double.parse(zoom),
    );

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text(ciudad),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    CameraPosition location = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(double.parse(lat), double.parse(long)),
        tilt: 59.440717697143555,
        zoom: double.parse(zoom));
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
  }
}
