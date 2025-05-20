import 'package:flutter/material.dart';
import 'package:masaar/views/ride_logs_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Center(child: RideLogs()));
  }
}
