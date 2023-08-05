import 'package:flutter/material.dart';
import '../widgets/nav_widget.dart' as nav;

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call Screen'),
        endDrawer: const Drawer(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('Your video call content goes here.'),
      ),
      bottomNavigationBar: const nav.Nav(),
    );
  }
}
