import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state)=>const HomeScreen(),
      ),
    GoRoute(
      path: '/cards',
      builder: (context, state)=>const CardsScreen(),
      ),
    GoRoute(
      path: '/buttons',
      builder: (context, state)=>const ButtonsScreen(),
      ),
  ],
);
