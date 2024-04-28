import 'package:flutter/material.dart';
import 'package:lightsync/services/location.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  Location location = Location();
  bool loading = true;

  @override
  void initState() {
    location.getLocation();
    super.initState();
  }

  Widget loadLocation() {
    if (location.longitude == null || location.latitude == null) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: [
          Text("Latitude: ${location.latitude}"),
          Text("Longitude: ${location.longitude}"),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loadLocation(),
      ],
    );
  }
}
