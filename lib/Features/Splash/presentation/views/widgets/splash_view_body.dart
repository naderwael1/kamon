import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamon/Features/auth/UI/login_screen.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';
import 'dart:async'; // Import dart:async for Future

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> leftSlidingAnimation;
  late Animation<Offset> rightSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimated();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const LoginScreen(), transition: Transition.fade);
    });
  }

  void initAnimated() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    leftSlidingAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(animationController);
    rightSlidingAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 130,
          width: 140,
          child: Image.asset(
            'assets/images/logo.png', // Replace with your ce image asset path
          ),
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Center static image with padding
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: 35,
                  width: 50,
                  child: Image.asset(
                    'assets/images/m.png', // Replace with your ce image asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Left sliding image with padding
              SlideTransition(
                position: leftSlidingAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 110), // Adjust width - half of center image
                  child: SizedBox(
                    height: 53,
                    width: 50, // Half of the total width
                    child: Image.asset(
                      'assets/images/ka.png', // Replace with your left image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Right sliding image with padding
              SlideTransition(
                position: rightSlidingAnimation,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(110, 5, 0, 0),
                  // Adjust width - half of center image
                  child: SizedBox(
                    height: 50,
                    width: 55, // Half of the total width
                    child: Image.asset(
                      'assets/images/on.png', // Replace with your right image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        AnimateText(slidingAnimation: leftSlidingAnimation),
      ],
    );
  }
}

class AnimateText extends StatelessWidget {
  const AnimateText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              "King of FooD ",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
