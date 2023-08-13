import 'package:flutter/material.dart';
// import '../widgets/nav_widget.dart' as nav;
import 'package:agora_uikit/agora_uikit.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreeState();
}

class _VideoCallScreeState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: ' fafa0504cabc493589c9681dca2dbab9 ',
      channelName: 'flutter text',
      tempToken:
          '007eJxTYLj8YN/jzgR+84J/lbrJp+1eyS3Y11V49nBo+AGdAq47xpoKDGmJaYkGpgYmyYlJySaWxqYWlsmWZhaGKcmJRilJiUmWCqGXUxoCGRm4yxYxMTJAIIjPw5CWU1pSklqkUJJaUcLAAAC/viNs',
    ),
  );

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Video Call'),
          centerTitle: true,
          endDrawer: const Drawer(),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: const [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
