import 'package:flutter/material.dart';
import '/Services/location_service.dart';
import '../widgets/nav_widget.dart' as nav;

class LocationScreen extends StatefulWidget {
  final LocationService locationService;

  const LocationScreen(
      {required Key key,
      required this.locationService,
      required String initialRoute})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _currentLocation = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    String currentLocation = await widget.locationService.getCurrentLocation();
    setState(() {
      _currentLocation = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        endDrawer: const Drawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_currentLocation),
            ElevatedButton(
              onPressed: () {
                // Return the selected location to the previous screen
                Navigator.pop(context, _currentLocation);
              },
              child: const Text('Use This Location'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const nav.Nav()
    );
  }
}
