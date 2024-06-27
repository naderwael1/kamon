// recommendation_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:kamon/constant.dart';

class RecommendationService {
  Future<List<int>> getRecommendedItemIds(int itemId) async {
    final response = await http.get(Uri.parse(
        'http://localhost:4000/admin/menu/itemRecommendations2/$itemId'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 'success') {
        List<dynamic> favoriteItems = jsonResponse['data']['favoriteItems'];
        List<int> itemIds = favoriteItems.map<int>((item) {
          String recommendationString = item['get_item_recommendations_2'];
          return int.parse(recommendationString.substring(
              1, recommendationString.indexOf(',')));
        }).toList();
        return itemIds;
      } else {
        throw Exception('Failed to load recommendation data');
      }
    } else {
      throw Exception('Failed to retrieve data');
    }
  }

  Future<MenuItem> getItemDetails(int itemId) async {
    final response = await http.get(Uri.parse(
        'http://$baseUrl/admin/menu/itemDetails/$itemId')); // Assuming there's an API to get item details by ID

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 'success') {
        return MenuItem.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to load item details');
      }
    } else {
      throw Exception('Failed to retrieve data');
    }
  }
}
