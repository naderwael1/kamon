import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamon/constant.dart';
import 'Features/Splash/presentation/views/splash_view.dart'; // Correct import path

void main() {
  runApp(const Kamon());
}

class Kamon extends StatelessWidget {
  const Kamon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, // Set your default theme here
          scaffoldBackgroundColor: KSecondaryColor
          // Add other theme configurations if needed
          ),
      home: const SplashView(),
    );
  }
}
