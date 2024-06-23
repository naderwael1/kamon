import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/data/get_menu.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';

class SearchViewModel extends ChangeNotifier {
  final GetMenu _apiService = GetMenu();
  List<MenuItem> allMenuItems = [];
  List<MenuItem> searchedForMenuItems = [];
  bool isLoading = false;

  SearchViewModel() {
    fetchMenuItems();
  }

  Future<void> fetchMenuItems() async {
    isLoading = true;
    notifyListeners();
    try {
      allMenuItems = await _apiService.getMenu();
    } catch (error) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchMenuItems(String query) {
    if (query.isEmpty) {
      searchedForMenuItems = [];
    } else {
      searchedForMenuItems = allMenuItems
          .where((menuItem) =>
              menuItem.itemName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
