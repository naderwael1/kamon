import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/presentation/item_screen_clip_path.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BaseClipper(),
            child: const ItemScreenClipPath(),
          ),
        ],
      ),
    );
  }
}
