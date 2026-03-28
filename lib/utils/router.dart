import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/data/networks/network_connectivity.dart';
import 'package:todolist/views/no_internet_screen/no_internet_screen.dart';
import 'package:todolist/views/to_do_list_home_page/to_do_list_homepage.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final bool online = NetworkConnectivityService().isConnected;
      final bool isGoingToNoInternet = state.matchedLocation == '/no-internet';

      if (!online) {
        return '/no-internet';
      }

      if (online && isGoingToNoInternet) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const ToDoListHomepage(),
      ),
      GoRoute(
        path: '/no-internet',
        builder: (context, state) => const NoInternetScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
