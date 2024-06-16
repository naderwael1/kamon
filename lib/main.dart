import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Splash/presentation/views/splash_view.dart'; // Correct import path

void main() {
  runApp(const kamon());
}

class kamon extends StatelessWidget {
  const kamon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light, // Set your default theme here
        // Add other theme configurations if needed
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Set your dark theme here
        // Add other dark theme configurations if needed
      ),
      themeMode: ThemeMode.system, // Change based on user preference if needed
      home: const SplashView(),
    );
  }
}
