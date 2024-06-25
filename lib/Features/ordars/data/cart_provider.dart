import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';

class CartProvider with ChangeNotifier {
  List<MenuItem> _items = [];
  Map<int, int> _itemQuantities = {};

  List<MenuItem> get items => _items;
  Map<int, int> get itemQuantities => _itemQuantities;

  void addItem(MenuItem menuItem) {
    if (_items.contains(menuItem)) {
      _itemQuantities[menuItem.itemId] = _itemQuantities[menuItem.itemId]! + 1;
    } else {
      _items.add(menuItem);
      _itemQuantities[menuItem.itemId] = 1;
    }
    notifyListeners();
  }

  void removeItem(MenuItem menuItem) {
    if (_items.contains(menuItem) && _itemQuantities[menuItem.itemId]! > 1) {
      _itemQuantities[menuItem.itemId] = _itemQuantities[menuItem.itemId]! - 1;
    } else {
      _items.remove(menuItem);
      _itemQuantities.remove(menuItem.itemId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _itemQuantities.clear();
    notifyListeners();
  }

  double get totalPrice => _items.fold(
      0,
      (total, current) =>
          total +
          double.parse(current.price) * _itemQuantities[current.itemId]!);
}
