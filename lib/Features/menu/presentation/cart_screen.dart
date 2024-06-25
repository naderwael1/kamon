import 'package:flutter/material.dart';
import 'package:kamon/Features/ordars/data/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:kamon/Features/ordars/non_virtual_order/data/post_non_virual.dart';
import 'package:kamon/Features/ordars/non_virtual_order/model/non_virual_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  Future<void> _placeOrder(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    int? branchId = prefs.getInt('branchId');

    if (branchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to get branch information'),
      ));
      return;
    }

    List<OrderItem> orderItems = cartProvider.items.map((menuItem) {
      return OrderItem(
        itemId: menuItem.itemId,
        quantity: cartProvider.itemQuantities[menuItem.itemId]!,
        quotePrice: double.parse(menuItem.price),
      );
    }).toList();

    Order order = Order(
      customerId: '2',
      branchId: branchId.toString(),
      orderType: 'delivery',
      orderStatus: 'pending',
      totalPrice: cartProvider.totalPrice.toString(),
      paymentMethod: 'cash',
      orderItems: orderItems,
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
      cartProvider.clearCart();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to place order: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final menuItem = cartProvider.items[index];
          return ListTile(
            title: Text(menuItem.itemName),
            subtitle: Text(
                '${cartProvider.itemQuantities[menuItem.itemId]} x ${menuItem.price} EGP'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.removeItem(menuItem);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => _placeOrder(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
              'Place Order (${cartProvider.totalPrice.toStringAsFixed(2)} EGP)'),
        ),
      ),
    );
  }
}
