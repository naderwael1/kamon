import 'package:flutter/material.dart';

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
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '$rating',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '($reviewsCount Reviews)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 22,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  // Decrease quantity logic
                },
              ),
              Text(
                '1',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  // Increase quantity logic
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
