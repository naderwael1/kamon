import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kamon/constant.dart';
import 'package:kamon/core/utils/app_router.dart';

import 'Features/Splash/presentation/views/splash_view.dart'; // Correct import path

void main() {
  runApp(const Kamon());
}

class Kamon extends StatelessWidget {
  const Kamon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, // Set your default theme here
          scaffoldBackgroundColor: kSecondaryColor
          // Add other theme configurations if needed
          ),
    );
  }
}
