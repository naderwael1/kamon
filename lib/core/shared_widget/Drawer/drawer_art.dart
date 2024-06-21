import 'package:flutter/material.dart';
import 'drawer_item_model.dart';
class CustomDrwerItem extends StatelessWidget {
  const CustomDrwerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(
          drawerItemModel.icon,
      ),
      title: Text(drawerItemModel.title),

    );
  }
}
