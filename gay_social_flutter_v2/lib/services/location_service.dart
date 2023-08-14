// import 'package:geolocator/geolocator.dart';

// class LocationService {

//   Future<String> getLocation() async {
//     return await Geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((value) {
//       return value.toString();
//     });
//   }

//   Future<String> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return 'Location services are disabled.';
//     }

//     // Check location permissions
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.always &&
//           permission != LocationPermission.whileInUse) {
//         return 'Location permission not granted.';
//       }
//     }

//     // Get the current location
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     return 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
//   }
// }
