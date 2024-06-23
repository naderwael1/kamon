import 'package:http/http.dart' as http;
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'dart:convert';

class GetMenu {
  Future<List<MenuItem>> getMenu(int branchId) async {
    final response = await http.get(Uri.parse(
        'http://192.168.10.1:4000/admin/menu/branchMenuFilter/$branchId'));

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
}
