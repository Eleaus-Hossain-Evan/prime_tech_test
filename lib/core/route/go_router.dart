import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prime_tech_test/features/category/presentation/category_screen.dart';
import 'package:prime_tech_test/features/profile/presentation/profile_screen.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../core.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  // final listenable = ValueNotifier<bool>(true);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: SplashScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [
        BotToastNavigatorObserver(),
      ]);
});

class RouterNotifier extends Listenable {
  final Ref _ref;

  RouterNotifier(this._ref);

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final token = _ref.watch(loggedInProvider.notifier).token;
    final user = _ref.watch(loggedInProvider.notifier).user;

    final isLoggedIn = _ref.watch(loggedInProvider).loggedIn; //bool

    // final isOnboarding = _ref.watch(loggedInProvider).onboarding; //bool

    log('RouterNotifier: isLoggedIn - $isLoggedIn');
    log('RouterNotifier:  $token, $user');
    log('matchedLocation:  ${state.matchedLocation}');

    final areWeLoggingIn = state.matchedLocation == LoginScreen.route;
    log('areWeLoggingIn:  $areWeLoggingIn');

    if (!isLoggedIn && areWeLoggingIn) {
      return areWeLoggingIn ? null : LoginScreen.route;
    }

    if (areWeLoggingIn) {
      return CategoryScreen.route;
    }

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: CategoryScreen.route,
          builder: (context, state) => const CategoryScreen(),
        ),
        GoRoute(
          path: ProfileScreen.route,
          builder: (context, state) => const ProfileScreen(),
        ),
      ];

  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );

  @override
  void addListener(VoidCallback listener) {
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => listener,
    );
  }

  @override
  void removeListener(VoidCallback listener) {
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => listener,
    );
  }
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    super.key,
    required super.child,
    super.fullscreenDialog = true,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          }, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    super.key,
    required super.child,
  }) : super(
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          }, // Here you may also wrap this child with some common designed widget
        );
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({
    super.key,
    required super.child,
  }) : super(
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
        );
}
