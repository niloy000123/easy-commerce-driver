import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_ecommerce_delivery_app/app_page/splash_page.dart';
import 'package:simple_ecommerce_delivery_app/app_page/welcome_page.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/global_function.dart';
import 'package:simple_ecommerce_delivery_app/features/auth/view/review_detail_page.dart';
import 'package:simple_ecommerce_delivery_app/features/auth/view/signin_page.dart';
import 'package:simple_ecommerce_delivery_app/features/home/view/home_page.dart';
import 'package:simple_ecommerce_delivery_app/features/order_detail/view/order_detail_page.dart';
import 'package:simple_ecommerce_delivery_app/features/profile_tab/view/pages/profile_page.dart';
import 'package:simple_ecommerce_delivery_app/init_dependencies.dart';

enum AppRoute {
  splash,
  welcome,
  signIn,
  signUp,
  home,
  forgotPassPage,
  reviewDetailPage,
  orderDetailPage,
  profile,
}

@LazySingleton()
class AppRouter {
  // static final AppRouter _instance = AppRouter._();
  // factory AppRouter() => _instance;

  // AppRouter._();

  final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: ApGlobalFunctions.navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: SplashPage(hiveService: serviceLocator()),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
      ),

      GoRoute(
        path: '/welcome',
        name: AppRoute.welcome.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: WelcomePage(hiveService: serviceLocator()),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
      ),

      GoRoute(
        path: '/signin',
        name: AppRoute.signIn.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: SigninPage(),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
        routes: [
          GoRoute(
            path: 'review_detail_page',
            name: AppRoute.reviewDetailPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                child: ReviewDetailPage(),
                transitionsBuilder: _customPageTransitionBuilder,
              );
            },
          ),
        ],
      ),

      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: HomePage(),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
      ),
      GoRoute(
        path: '/order_detail_page',
        name: AppRoute.orderDetailPage.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: OrderDetailPage(),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
      ),
      GoRoute(
        path: '/profile',
        name: AppRoute.profile.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            child: ProfilePage(serviceLocator()),
            transitionsBuilder: _customPageTransitionBuilder,
          );
        },
      ),
    ],
  );
}

Widget _customPageTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 0),
    reverseDuration: const Duration(milliseconds: 0),
  ).transitionsBuilder(context, animation, secondaryAnimation, child);
}
