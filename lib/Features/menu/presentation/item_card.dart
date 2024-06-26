import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kamon/Features/ordars/non_virtual_order/data/post_non_virual.dart';
import 'package:kamon/Features/ordars/non_virtual_order/model/non_virual_model.dart';
import 'package:kamon/Features/ordars/data/cart_provider.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:go_router/go_router.dart';
import 'package:kamon/core/utils/app_router.dart';

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
  final String itemStatus;
  final int preparationTime;
  final MenuItem menuItem;

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
    required this.itemStatus,
    required this.preparationTime,
    required this.menuItem,
  }) : super(key: key);

  @override
  _ItemDetailCardState createState() => _ItemDetailCardState();
}

class _ItemDetailCardState extends State<ItemDetailCard> {
  int quantity = 1;

  void _placeOrder(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    int? branchId = prefs.getInt('branchId');

    if (branchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to get branch information'),
      ));
      return;
    }

    Order order = Order(
      customerId: '2',
      branchId: branchId.toString(),
      orderType: 'delivery',
      orderStatus: 'pending',
      totalPrice: (widget.price * quantity).toString(),
      paymentMethod: 'cash',
      orderItems: [
        OrderItem(
          itemId: widget.itemId,
          quantity: quantity,
          quotePrice: widget.price,
        ),
      ],
      additionalDiscount: '0',
      creditCardNumber: '1234567891234567',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(widget.price * quantity).toStringAsFixed(2)} EGP',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 185, 119),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularIconButton(
                      icon: Icons.remove,
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
                    CircularIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                widget.itemStatus == 'active'
                    ? Icons.check_circle
                    : Icons.warning,
                color:
                    widget.itemStatus == 'active' ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                widget.itemStatus == 'active' ? 'Active' : 'Inactive',
                style: TextStyle(
                  fontSize: 16,
                  color:
                      widget.itemStatus == 'active' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.timer, color: Colors.blue, size: 20),
              const SizedBox(width: 4),
              Text(
                'Preparation Time: ${widget.preparationTime} mins',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (widget.vegetarian)
                const Row(
                  children: [
                    Icon(Icons.eco, color: Colors.green, size: 20),
                    SizedBox(width: 4),
                    Text(
                      'Vegetarian',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              if (widget.healthy)
                const Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    SizedBox(width: 4),
                    Text(
                      'Healthy',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.itemDescription,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 25,
              color: const Color.fromARGB(255, 85, 1, 1),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(widget.menuItem, quantity);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Item added to cart'),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text('Add to Cart'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.KCartScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text('Go to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = const Color.fromARGB(102, 36, 10, 51),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
        iconSize: 24.0,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
