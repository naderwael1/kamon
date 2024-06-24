import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kamon/Features/Splash/presentation/views/splash_view.dart';
import 'package:kamon/Features/app_layout/screens/app_layout_screen.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:kamon/Features/menu/presentation/item_detail_screen.dart';
import 'package:kamon/Features/menu/presentation/item_screen.dart';
import 'dart:convert';
import 'package:kamon/Features/ordars/non_virtual_order/model/non_virual_model.dart'; // Import your MenuItem model

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KItemScreen = '/itemScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const AppLayoutScreen(
          branchId: 1,
          branchLocation: '',
        ),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) {
          final String jsonString = state.extra as String;
          final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          final menuItem = MenuItem.fromJson(jsonMap);

          return ItemScreen(
            menuItem: menuItem,
          );
        },
      ),
    ],
  );
}
