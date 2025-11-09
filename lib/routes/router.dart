import 'package:flutter/material.dart';
import 'package:flutter_app/domain/repositories/auth_repositoy.dart';
import 'package:flutter_app/ui/home/home_screen.dart';
import 'package:flutter_app/ui/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final useProfile = ref.watch(authRepository);
  final isLogged = useProfile == null || useProfile.name.isEmpty;

  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: "/login",
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
    ],
    redirect: (context, state) {
      if (isLogged) {
        return "/login";
      } else {
        return null;
      }
    },
  );
});
