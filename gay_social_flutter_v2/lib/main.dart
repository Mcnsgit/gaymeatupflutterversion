import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/home_screen.dart';
import 'widgets/nav_widget.dart' as nav;

void main() => runApp(const HomeScreen(title: 'Pronto Pigs',));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pronto Pigs',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Header Bar'),
          endDrawer: const Drawer(),
          ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
      bottomNavigationBar: const nav.Nav(),
    );
  }
}

  
