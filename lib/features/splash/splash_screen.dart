import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../auth/presentation/login_screen.dart';

class SplashScreen extends HookConsumerWidget {
  static const route = '/splash';

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        return Future.delayed(const Duration(seconds: 3), () {
          Router.neglect(context, () {
            // if (isOnboard.value && token.isNotEmpty) {
            //   context.go(MainNav.route);
            // } else if (isOnboard.value && token.isNotEmpty == false) {
            //   context.go(LoginScreen.route);
            // }
            context.go(LoginScreen.route);
          });
        });
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: "LOGO"
            .text
            .textStyle(Theme.of(context).textTheme.displayLarge)
            .make(),
      ),
    );
  }
}
