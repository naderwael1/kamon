// get_menu.dart

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'dart:convert';

import 'package:kamon/constant.dart';

class GetMenu {
  final Map<String, List<double>> branches = {
    'Cairo': [30.0444, 31.2357],
    'Alexandria': [31.2001, 29.9187],
    'Port Said': [31.2653, 32.3019],
  };

  Future<List<MenuItem>> getMenu() async {
    int branchId = await _getBranchIdBasedOnLocation();
    final response = await http.get(Uri.parse(
        'http://$baseUrl:4000/admin/menu/branchMenuFilter/$branchId'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 'success') {
        List<dynamic> itemData = jsonResponse['data'];
        return itemData.map((data) => MenuItem.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load menu data');
      }
    } else {
      throw Exception('Failed to retrieve data');
    }
  }

  Future<int> _getBranchIdBasedOnLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double minDistance = double.infinity;
      String closestBranch = '';
      const double deliveryRadius = 10000.0; // 10 km in meters

      branches.forEach((branch, coordinates) {
        double distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          coordinates[0],
          coordinates[1],
        );
        if (distance < minDistance) {
          minDistance = distance;
          closestBranch = branch;
        }
      });

      if (minDistance <= deliveryRadius) {
        return _getBranchId(closestBranch);
      } else {
        return 0; // Out of delivery area
      }
    } catch (e) {
      return 0; // Failed to determine location
    }
  }

  int _getBranchId(String branchName) {
    switch (branchName) {
      case 'Cairo':
        return 3;
      case 'Alexandria':
        return 1;
      case 'Port Said':
        return 2;
      default:
        return 0; // or handle appropriately
    }
  }
}
