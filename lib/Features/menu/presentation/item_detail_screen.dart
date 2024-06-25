import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:kamon/Features/menu/presentation/circular_image.dart';
import 'package:kamon/Features/menu/presentation/item_screen_clip_path.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';
import 'package:kamon/Features/menu/presentation/item_card.dart';

class ItemDetailScreen extends StatelessWidget {
  final MenuItem menuItem;

  const ItemDetailScreen({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double price = double.tryParse(menuItem.price) ?? 0.0;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(clipper: BaseClipper(), child: const ItemScreenClipPath()),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                Center(
                  child: CircularImageWithShadow(
                    imageUrl: menuItem.picturePath ??
                        'https://example.com/default-image.jpg',
                    size: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ItemDetailCard(
                    mealTime: menuItem.categoryId.toString(),
                    itemName: menuItem.itemName,
                    rating: double.parse(menuItem.averageRating),
                    reviewsCount: menuItem.ratersNumber,
                    price: price,
                    itemId: menuItem.itemId,
                    itemDescription: menuItem.itemDescription,
                    vegetarian: menuItem.vegetarian,
                    healthy: menuItem.healthy,
                    itemStatus: menuItem.itemStatus,
                    preparationTime: menuItem.preparationTime.minutes,
                    menuItem: menuItem,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
