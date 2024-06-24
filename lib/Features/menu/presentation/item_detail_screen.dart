import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:kamon/Features/menu/presentation/circular_image.dart';
import 'package:kamon/Features/menu/presentation/item_screen_clip_path.dart';
import 'package:kamon/Features/ordars/non_virtual_order/data/post_non_virual.dart';
import 'package:kamon/Features/ordars/non_virtual_order/model/non_virual_model.dart'; // Import your MenuItem model
import 'package:kamon/core/shared_widget/base_clip_path.dart';

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
                    mealTime: menuItem.categoryId.toString() ?? '',
                    itemName: menuItem.itemName,
                    rating: double.parse(menuItem.averageRating),
                    reviewsCount: menuItem.ratersNumber,
                    price: price,
                    itemId: menuItem.itemId,
                    itemDescription: menuItem.itemDescription,
                    vegetarian: menuItem.vegetarian,
                    healthy: menuItem.healthy,
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

class ItemDetailCard extends StatefulWidget {
  final String mealTime;
  final String itemName;
  final double rating;
  final int reviewsCount;
  final double price;
  final int itemId;
  final String itemDescription;
  final bool vegetarian;
  final bool healthy;

  const ItemDetailCard({
    Key? key,
    required this.mealTime,
    required this.itemName,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.itemId,
    required this.itemDescription,
    required this.vegetarian,
    required this.healthy,
  }) : super(key: key);

  @override
  _ItemDetailCardState createState() => _ItemDetailCardState();
}

class _ItemDetailCardState extends State<ItemDetailCard> {
  int quantity = 1;

  void _placeOrder(BuildContext context) async {
    Order order = Order(
      customerId: '2',
      branchId: '2',
      orderType: 'delivery',
      orderStatus: 'pending',
      totalPrice: (widget.price * quantity).toString(),
      paymentMethod: 'cash',
      orderItems: [
        OrderItem(
            itemId: widget.itemId,
            quantity: quantity,
            quotePrice: widget.price),
      ],
      additionalDiscount: '0',
      creditCardNumber: '1234567891234567', // Example card number
      creditCardExpireMonth: '6',
      creditCardExpireDay: '17',
      nameOnCard: 'ismail',
      tableId: '1',
      addressId: '1',
      customerPhoneId: '1',
    );

    try {
      String response = await placeOrder(order);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order placed successfully: $response'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to place order: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.mealTime,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    widget.itemName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.rating}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(${widget.reviewsCount} Reviews)',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (widget.vegetarian)
            Row(
              children: [
                const Icon(Icons.eco, color: Colors.green, size: 20),
                const SizedBox(width: 4),
                const Text(
                  'Vegetarian',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          if (widget.healthy)
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 20),
                const SizedBox(width: 4),
                const Text(
                  'Healthy',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          Text(
            widget.itemDescription,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${(widget.price * quantity).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 22,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
              ),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => _placeOrder(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }
}
