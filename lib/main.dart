import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:masaar/views/home_page.dart';
import 'package:masaar/widgets/bottom_navbar.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
      getPages: [GetPage(name: '/Home', page: () => HomePage()),
      GetPage(name: '/route', page: () =>  RoutePage()),
      GetPage(name: '/pickup', page: () => const Routeconfirmation()),
      GetPage(name: '/Destination', page: () => const Destinationconfirmation()),


],
    ),
  );
}
