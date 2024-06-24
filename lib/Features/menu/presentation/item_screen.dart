import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/presentation/item_screen_clip_path.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class ItemScreen extends StatelessWidget {
  final int itemId;
  final String itemName;
  final String itemDescription;

  const ItemScreen({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BaseClipper(),
            child: const ItemScreenClipPath(),
          ),
          Center(
            child: Column(
              children: [
                Text('Item ID: $itemId'),
                Text('Item Name: $itemName'),
                Text('Item Description: $itemDescription'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
