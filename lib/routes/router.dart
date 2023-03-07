import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/screens/category/category_screen.dart';
import 'package:flutter_base/screens/login/bloc/login_cubit.dart';
import 'package:flutter_base/screens/login/login_screen.dart';
import 'package:flutter_base/screens/product/product_list_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/error/error_screen.dart';
import './route_path.dart';

class AppRouter{
  final LoginCubit loginCubit;

  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: RoutePaths.home,
    routes: <GoRoute>[
      GoRoute(path: '/login',builder: (context,state) => const LoginScreen()),
      GoRoute(
        name: RouteName.home,
        path: RoutePaths.home,
        builder: (context, state) => const CategoryScreen(),
        routes: [
          GoRoute(
            name: RouteName.products,
            path: RoutePaths.productListByCateId,
            builder: (context, state) => ProductListScreen(
              category: state.params['category']!,
              asc: state.queryParams['sort'] == 'asc',
              quantity: int.parse(state.queryParams['filter'] ?? '0'),
            ),
          ),
        ],
      ),
    ],
    redirect: (context,state) {
      // Check if the user is logged in.
      final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
      // Check if user logging in.
      final bool loggingIn = state.subloc == '/login';
      if(!loggedIn){
        return loggingIn ? null : '/login';
      }
      if(loggingIn){
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(loginCubit.stream),
    errorPageBuilder: (context, state) => const MaterialPage(child: ErrorScreen())
  );
}

class GoRouterRefreshStream extends ChangeNotifier{
  GoRouterRefreshStream(Stream<dynamic> stream){
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic _) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
