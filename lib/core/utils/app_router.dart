import 'package:go_router/go_router.dart';
import 'package:kamon/Features/Splash/presentation/views/splash_view.dart';
import 'package:kamon/Features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(
          branchId: 1,
          branchLocation: '',
        ),
      ),
    ],
  );
}
