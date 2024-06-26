import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kamon/Features/Splash/presentation/views/splash_view.dart';
import 'package:kamon/Features/app_layout/screens/app_layout_screen.dart';
import 'package:kamon/Features/menu/model/menu_model.dart';
import 'package:kamon/Features/menu/presentation/item_screen.dart';
import 'package:kamon/Features/ordars/cart_screen.dart';
import 'package:kamon/Features/ordars/data/cart_provider.dart';
import 'package:kamon/Features/payment/UI.dart';
import 'package:kamon/Features/payment/thank_you_view.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KItemScreen = '/itemScreen';
  static const KCartScreen = '/cartScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
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
      GoRoute(
        path: KCartScreen,
        builder: (context, state) => Consumer<CartProvider>(
          builder: (context, cart, child) => CartScreen(cart: cart),
        ),
      ),
    ],
  );
}
