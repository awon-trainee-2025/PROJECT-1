import 'package:flutter/material.dart';
//import 'package:masaar/views/search_bar.dart';
import 'package:masaar/views/test.dart';
import 'package:masaar/widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Test(),
      home: BottomNavBar(),
    );
  }
}
