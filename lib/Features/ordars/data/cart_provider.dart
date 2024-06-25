import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(MenuItem menuItem, int quantity) {
    final index =
        _items.indexWhere((item) => item.menuItem.itemId == menuItem.itemId);
    if (index != -1) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(menuItem: menuItem, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(MenuItem menuItem) {
    _items.removeWhere((item) => item.menuItem.itemId == menuItem.itemId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (total, current) {
      final double itemPrice = double.tryParse(current.menuItem.price) ?? 0.0;
      return total + itemPrice * current.quantity;
    });
  }

  void updateItemQuantity(int itemId, int quantity) {}
}

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({required this.menuItem, this.quantity = 1});
}
