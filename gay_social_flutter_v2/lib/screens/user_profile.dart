// import 'package:flutter/material.dart';
// import '../widgets/nav_widget.dart' as nav;


// class UserProfileScreen extends StatelessWidget {
//   const UserProfileScreen({Key? key}) : super(key: key);
      

//   @override
//   Widget build(BuildContext context) {
//     return Container (
//        appBar: const AppBar(
//         backgroundColor: const Color(0xffFF8527),
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),        
//         title: const Text('User Profile', 
//        ),
//       endDrawer: const Drawer(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(
//                   'assets/user_avatar.png'), // Replace with the actual user avatar.
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'John Doe', // Replace with the user's name.
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Age: 28', // Replace with the user's age.
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Location: New York', // Replace with the user's location.
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'About Me', // Replace with a section title like "About Me" or "Bio".
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'I love hiking and exploring new places!', // Replace with the user's bio.
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality to edit the user's profile.
//               },
//               child: const Text('Edit Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }