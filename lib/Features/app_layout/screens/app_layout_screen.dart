import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamon/Features/app_layout/controllers/app_layout_cubit.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';

/// AppLayoutScreen
class AppLayoutScreen extends StatelessWidget {
  /// AppLayoutScreen constructor
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const HomeView(),
      const HomeView(),
      const HomeView(),
      const HomeView(),
    ];

    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocBuilder<AppLayoutCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.home),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.search),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.dashboard_sharp),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.dashboard_sharp,
                      color: Colors.red,
                    ),
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.person),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: state,
              onTap: (index) =>
                  context.read<AppLayoutCubit>().changeIndex(index),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}
