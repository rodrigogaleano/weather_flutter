import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/cities_list/cities_view_controller.dart';
import '../features/city/city_view_controller.dart';
import '../features/home/home_view_controller.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static const String homeRoute = '/home';
  static const String cityRoute = 'city';
  static const String citiesListRoute = 'citiesList';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: homeRoute,
    routes: [
      GoRoute(
        path: homeRoute,
        name: homeRoute,
        builder: (_, __) => const HomeViewController(),
        routes: [
          GoRoute(
            path: citiesListRoute,
            name: citiesListRoute,
            builder: (_, __) => const CitiesViewController(),
            routes: [
              GoRoute(
                path: cityRoute,
                name: cityRoute,
                builder: (_, state) {
                  final cityName = state.extra as String;
                  return CityViewController(cityName: cityName);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
