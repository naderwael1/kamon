import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamon/Features/Splash/presentation/views/widgets/splash_view_body.dart';
import 'package:kamon/constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KPrimaryColor,
      body: SplashViewbody(),
    );
  }
}
