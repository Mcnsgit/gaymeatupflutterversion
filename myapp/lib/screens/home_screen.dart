import 'package:flutter/material.dart';
import 'package:myapp/screens/video_call_screen.dart';
import 'package:myapp/screens/user_profile.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'bottom_naviagtion_bar_widget.dart';
  class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<String>? listUser = ['A', 'B', 'C', 'D', 'E'];
  final listViewKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final bool _isLoading = false;
  String? _currentPosition;
  String? _currentLookingFor;
  RangeValues _currentAgeRange = const RangeValues(18, 75);
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 
          _scrollController.position.maxScrollExtent) {
        _onRefresh();
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      listUser!.addAll(['F', 'G', 'H']);
    });
  }          
  List<DropdownMenuItem<String>> _getPositionDropdownItems() {
    return [
      const DropdownMenuItem<String>(
        value: '',
        child: Text('Any'),
      ),
      const DropdownMenuItem<String>(
        value: 'Top',
        child: Text('Top'),
      ),
      const DropdownMenuItem<String>(
        value: 'Top Vers',
        child: Text('Top Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Vers',
        child: Text('Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Side',
        child: Text('Side'),
      ),
      const DropdownMenuItem<String>(
        value: 'Bottom Vers',
        child: Text('Bottom Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Bottom',
        child: Text('Bottom'),
      ),
    ];
  }
  List<DropdownMenuItem<String>> _getLookingForDropdownItems() {
    return [
      const DropdownMenuItem<String>(
        value: '',
        child: Text('Any'),
      ),
      const DropdownMenuItem<String>(
        value: 'Now Host',
        child: Text('Now Host'),
      ),
      const DropdownMenuItem<String>(
        value: 'Cruising',
        child: Text('Cruising'),
      ),
      const DropdownMenuItem<String>(
        value: 'Car',
        child: Text('Car'),
      ),
      const DropdownMenuItem<String>(
        value: 'Chat',
        child: Text('Chat'),
      ),
      const DropdownMenuItem<String>(
        value: 'Cam',
        child: Text('Cam'),
      ),
    ];
  }
  void _openFilterDrawer() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          padding: const EdgeInsets.all(10),
          child:  Column(
            children:  <Widget>[ 
                const Text( 
                'Filter Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Age Range:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              RangeSlider(
                values: _currentAgeRange,
                min: 18,
                max: 75,
                divisions: 57,
                labels: RangeLabels(
                  _currentAgeRange.start.round().toString(),
                  _currentAgeRange.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentAgeRange = values;
                  });
                },
              ),
              const SizedBox(height: 18),
              const Text(
                'Position:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _currentPosition,
                items: _getPositionDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    _currentPosition = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 18),
              const Text(
                'Looking For:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _currentLookingFor,
                items: _getLookingForDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    _currentLookingFor = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gay Meat Up'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilterDrawer,
          ),
        ],
      ),
      body: SafeArea(
        child:
            CustomScrollView(controller: _scrollController, slivers: <Widget>[
            const SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 0,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: const Color.fromARGB(255, 209, 209, 209),
                    child: Center(
                      child: Text('User Profile $index'),
                    ),
                  );
                },
                childCount:
                    18,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              )
            )
          ]
        ),
      ),
      floatingActionButton: _isLoading
          ? const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(),
            )
          : null,
      bottomNavigationBar: BottomNavBarTransparentFb1(
        initialRoute: '/home_screen',
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home_screen');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat_screen');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/video_call');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/user_profile');
          }
        },
        onHomeRoute: (context) => const HomeScreen(),
        onChatRoute: (context) => ChatScreen(),
        onUserProfileRoute: (context) => const UserProfileScreen(),
        onVideoCallRoute: (context) => const VideoCallScreen(),
      ),
    ); 
  }
}