import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:masaar/controllers/settings_controllers/account_controller.dart';
import 'package:masaar/controllers/auth_controller.dart';
import 'package:masaar/views/Home/active_cards.dart';
import 'package:masaar/views/Home/home_page.dart';
import 'package:masaar/views/Welcome/onBoarding/splash_screen.dart';
import 'package:masaar/widgets/custom%20widgets/bottom_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// main.dart

void main() async {
  await Supabase.initialize(
    url: 'https://vrsczitnkvjsterzxqpr.supabase.co',

    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZyc2N6aXRua3Zqc3Rlcnp4cXByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcwMzk0MDEsImV4cCI6MjA2MjYxNTQwMX0.e9JkJnDntFXaW5zgCcS-A1ebMuZOfmFW59AADrB3OM4',
  );
  Get.put(AccountController());
  Get.put(AuthController());

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const StartupScreen(),
      home: const ActiveCards(),
      getPages: [
        GetPage(name: '/Home', page: () => HomePage()),
        GetPage(name: '/route', page: () => RoutePage()),
        GetPage(name: '/pickup', page: () => const Routeconfirmation()),
        GetPage(
          name: '/Destination',
          page: () => const Destinationconfirmation(),
        ),
      ],
    );
  }
}

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500)),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (session != null && session.user != null) {
          return const BottomNavBar();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
