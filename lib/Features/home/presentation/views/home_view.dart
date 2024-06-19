import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamon/Features/home/presentation/views/widgets/home_clip.dart';
import 'package:kamon/constant.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BaseClipper(),
            child: const HomeClip(),
          ),
        ],
      ),
    );
  }
}
