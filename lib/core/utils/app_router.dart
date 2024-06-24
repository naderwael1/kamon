import 'package:go_router/go_router.dart';
import 'package:kamon/Features/Splash/presentation/views/splash_view.dart';
import 'package:kamon/Features/app_layout/screens/app_layout_screen.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';
import 'package:kamon/Features/menu/presentation/item_screen.dart';

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
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final itemId = extra['itemId'] as int;
          final itemName = extra['itemName'] as String;
          final itemDescription = extra['itemDescription'] as String;
          final averageRating = extra['averageRating'] as String;
          final ratersNumber = extra['ratersNumber'] as int;
          final price = extra['price'] as String;

          return ItemScreen(
            itemId: itemId,
            itemName: itemName,
            itemDescription: itemDescription,
            averageRating: averageRating,
            ratersNumber: ratersNumber,
            price: price,
            imageUrl: '',
          );
        },
      ),
    ],
  );
}
