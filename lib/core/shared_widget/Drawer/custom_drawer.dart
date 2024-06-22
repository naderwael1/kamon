import 'package:flutter/material.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';

import 'drawer_item_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  final List<DrawerItemModel> managerDrawerItems = const [
    DrawerItemModel(
      title: 'D A S H  B O A R D',
      icon: Icons.home,
      destination: HomeView(),
    ),
    DrawerItemModel(
      title: 'E M P L W E E S T A T E',
      icon: Icons.man,
      destination: HomeView(),
    ),
    DrawerItemModel(
      title: 'S E T T I N G S',
      icon: Icons.settings,
      destination: HomeView(),
    ),
    DrawerItemModel(
      title: 'L O G   O U T',
      icon: Icons.logout,
      destination: HomeView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffdbdbdb),
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset('media/avatar.jpg'),
          ),
          ManagerDrawerView(managerDrawerItems: managerDrawerItems)
        ],
      ),
    );
  }
}

class ManagerDrawerView extends StatelessWidget {
  const ManagerDrawerView({
    super.key,
    required this.managerDrawerItems,
  });

  final List<DrawerItemModel> managerDrawerItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: managerDrawerItems.length,
      itemBuilder: (context, index) {
        return CustomDrawerItem(drawerItemModel: managerDrawerItems[index]);
      },
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => drawerItemModel.destination),
        );
      },
      child: ListTile(
        title: Text(
          drawerItemModel.title,
          style:
              const TextStyle(color: Colors.black), // Set text color to black
        ),
        leading: Icon(
          drawerItemModel.icon,
          color: Colors.black, // Set icon color to black
        ),
      ),
    );
  }
}