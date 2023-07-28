import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class LocationService {
  final Location _location = Location();

  Future<String> getLocation() async {
    return await _location.getLocation().then((value) {
      return value.toString();
    });
  }

  Future<String> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return 'Location services are disabled.';
      }
    }

    // Check location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return 'Location permission not granted.';
      }
    }

    // Get the current location
    LocationData locationData = await _location.getLocation();
    return 'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}';
  }
}
