import 'package:flutter/material.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';
import 'package:sidebarx/sidebarx.dart';

class sideBarHR extends StatelessWidget {
  const sideBarHR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home', // Remove the extra comma here
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          },
        ),
        SidebarXItem(icon: Icons.search, label: 'Search'),
      ],
    );
  }
}
