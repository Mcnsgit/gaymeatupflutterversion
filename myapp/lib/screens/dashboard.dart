// import 'package:flutter/material.dart';
// import 'package:myapp/screens/online_user_filter.dart'; // assuming your_widget.dart is the name of the file that contains YourWidget class

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gay Meat Up'),
//       ),
//       body: const OnlineUserFilter(
//         ListVie,
//       ),
//     );
//   },
//   // ignore: library_private_types_in_public_api
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   List<String>? listUser = ['A', 'B', 'C', 'D', 'E'];
//   final listViewKey = GlobalKey();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _onRefresh();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _onRefresh() async {
//     // Simulate fetching new data from the server
//     await Future.delayed(const Duration(seconds: 2));

//     // Add new data to the existing listUser
//     setState(() {
//       listUser!.addAll(['F', 'G', 'H']);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OnlineUserFilter(
//         listUser: listUser,
//         listViewKey: listViewKey,
//         scrollController: _scrollController);
//   }
// }
