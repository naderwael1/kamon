import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamon/Features/app_layout/controllers/app_layout_cubit.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';
import 'package:kamon/Features/menu/presentation/active_emp_screen.dart';
import 'package:kamon/Features/ordars/activeOrder/active_order_screen.dart';
import 'package:kamon/Features/ordars/app_layout/screens/app_layout_screen.dart';
import 'package:kamon/Features/ordars/confirm_order/confirm_order_screen.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';
import 'package:kamon/core/shared_widget/my_button_nav_bar.dart';

/// AppLayoutScreen
class AppLayoutScreen extends StatelessWidget {
  /// AppLayoutScreen constructor
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const HomeView(),
      const OrderLayoutScreen(),
      const ActiveEmployeeScreen(),
      const BranchLocator(),
    ];

    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocBuilder<AppLayoutCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: ClipPath(
              clipper: BaseClipper(),
              child: screens[state],
            ),
            bottomNavigationBar: MyBottomNavigationBar(
              currentIndex: state,
              onTap: (index) =>
                  context.read<AppLayoutCubit>().changeIndex(index),
            ),
          );
        },
      ),
    );
  }
}
