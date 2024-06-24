import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/presentation/circular_image.dart';
import 'package:kamon/Features/menu/presentation/item_screen_clip_path.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class ItemScreen extends StatelessWidget {
  final int itemId;
  final String itemName;
  final String itemDescription;
  final String imageUrl;
  final String averageRating;
  final int ratersNumber;
  final String price;

  const ItemScreen({
    Key? key,
    required this.itemId,
    required this.itemName,
    required this.itemDescription,
    required this.imageUrl,
    required this.averageRating,
    required this.ratersNumber,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemDetailScreen(
        itemId: itemId,
        itemName: itemName,
        itemDescription: itemDescription,
        imageUrl: imageUrl,
        averageRating: averageRating,
        ratersNumber: ratersNumber,
        price: price,
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final int itemId;
  final String itemName;
  final String itemDescription;
  final String imageUrl;
  final String averageRating;
  final int ratersNumber;
  final String price;

  const ItemDetailScreen({
    Key? key,
    required this.itemId,
    required this.itemName,
    required this.itemDescription,
    required this.imageUrl,
    required this.averageRating,
    required this.ratersNumber,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(clipper: BaseClipper(), child: const ItemScreenClipPath()),
        Column(
          children: [
            const SizedBox(height: 150),
            Center(
              child: CircularImageWithShadow(
                imageUrl: imageUrl,
                size: 150.0,
              ),
            ),
            ItemDetailCard(
              mealTime: 'Lunch', // Example static value
              itemName: itemName,
              rating: double.parse(averageRating),
              reviewsCount: ratersNumber,
              price: double.parse(price),
            ),
          ],
        ),
      ],
    );
  }
}

class ItemDetailCard extends StatelessWidget {
  final String mealTime;
  final String itemName;
  final double rating;
  final int reviewsCount;
  final double price;

  const ItemDetailCard({
    Key? key,
    required this.mealTime,
    required this.itemName,
    required this.rating,
    required this.reviewsCount,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealTime,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '$rating',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '($reviewsCount Reviews)',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.orange),
                  onPressed: () {
                    // Decrease quantity logic
                  },
                ),
                const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.orange),
                  onPressed: () {
                    // Increase quantity logic
                  },
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
