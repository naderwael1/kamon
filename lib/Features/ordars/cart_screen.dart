import 'package:flutter/material.dart';
import 'package:kamon/Features/ordars/cart_clip.dart';
import 'package:kamon/Features/ordars/non_virtual_order/data/post_non_virual.dart';
import 'package:kamon/Features/ordars/non_virtual_order/model/non_virual_model.dart';
import 'package:kamon/core/network/dio_helper_pay.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';
import 'package:provider/provider.dart';
import 'package:kamon/Features/ordars/data/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatefulWidget {
  final CartProvider cart;

  const CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _selectedPaymentMethod = 'cash';

  Future<void> _placeOrder(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    int? branchId = prefs.getInt('branchId');

    if (branchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to get branch information'),
      ));
      return;
    }

    List<OrderItem> orderItems = widget.cart.items.map((cartItem) {
      final menuItem = cartItem.menuItem;
      return OrderItem(
        itemId: menuItem.itemId,
        quantity: cartItem.quantity,
        quotePrice: double.tryParse(menuItem.price) ?? 0.0,
      );
    }).toList();

    Order order = Order(
      customerId: '2',
      branchId: branchId.toString(),
      orderType: 'delivery',
      orderStatus: 'pending',
      totalPrice: widget.cart.totalPrice.toString(),
      paymentMethod: _selectedPaymentMethod,
      orderItems: orderItems,
      additionalDiscount: '0',
      creditCardNumber:
          _selectedPaymentMethod == 'card' ? '1234567891234567' : '',
      creditCardExpireMonth: _selectedPaymentMethod == 'card' ? '6' : '',
      creditCardExpireDay: _selectedPaymentMethod == 'card' ? '17' : '',
      nameOnCard: _selectedPaymentMethod == 'card' ? 'ismail' : '',
      tableId: '1',
      addressId: '1',
      customerPhoneId: '1',
    );

    try {
      if (_selectedPaymentMethod == 'card') {
        await _pay(widget.cart.totalPrice); // Call the _pay method
      } else {
        String response = await placeOrder(order);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Order placed successfully: $response'),
        ));
        widget.cart.clearCart();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to place order: $e'),
      ));
    }
  }

  Future<void> _pay(double amount) async {
    PaymobManager()
        .getPaymentKey(amount.toInt(), "EGP")
        .then((String paymentKey) {
      launchUrl(
        Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/853357?payment_token=$paymentKey"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BaseClipper(),
            child: const CartClip(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cart.items[index];
                return ListTile(
                  title: Text(cartItem.menuItem.itemName),
                  subtitle: Text(
                      '${cartItem.quantity} x ${cartItem.menuItem.price} EGP'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      widget.cart.removeItem(cartItem.menuItem);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Cash'),
                  leading: Radio<String>(
                    value: 'cash',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Card'),
                  leading: Radio<String>(
                    value: 'card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _placeOrder(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                      'Place Order (${widget.cart.totalPrice.toStringAsFixed(2)} EGP)'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
