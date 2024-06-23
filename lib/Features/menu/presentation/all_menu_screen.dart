import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamon/Features/menu/data/get_menu.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<List<MenuItem>> futureMenuItems;
  String branchLocation = 'Unknown';
  int branchId = 0;

  final Map<String, List<double>> branches = {
    'Cairo': [30.0444, 31.2357],
    'Alexandria': [31.2001, 29.9187],
    'Port Said': [31.2653, 32.3019],
  };

  @override
  void initState() {
    super.initState();
    getBranchAndFetchMenu();
  }

  Future<void> getBranchAndFetchMenu() async {
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

      setState(() {
        if (minDistance <= deliveryRadius) {
          branchLocation = closestBranch;
          branchId = getBranchId(closestBranch);
        } else {
          branchLocation = 'Out of delivery area';
          branchId = 0; // or handle appropriately
        }
        futureMenuItems = GetMenu().getMenu(branchId);
      });
    } catch (e) {
      setState(() {
        branchLocation = 'Failed to determine location';
        branchId = 0; // or handle appropriately
      });
    }
  }

  int getBranchId(String branchName) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: futureMenuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No menu items found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                MenuItem menuItem = snapshot.data![index];
                return ListTile(
                  title: Text(menuItem.itemName),
                  subtitle: Text(menuItem.itemDescription),
                  trailing: Text('\$${menuItem.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
