import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name, //Propiedad estatica que se agrego a cada widget para luego ser llamada aca. 
      builder: (context, state)=>const HomeScreen(),
      ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name, //Propiedad estatica que se agrego a cada widget para luego ser llamada aca.  
      builder: (context, state)=>const CardsScreen(),
      ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name, //Propiedad estatica que se agrego a cada widget para luego ser llamada aca.  
      builder: (context, state)=>const ButtonsScreen(),
      ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name, //Propiedad estatica que se agrego a cada widget para luego ser llamada aca.  
      builder: (context, state)=>const ProgressScreen(),
      ),
    GoRoute(
      path: '/snackbars',
      name: SnackBarScreen.name, //Propiedad estatica que se agrego a cada widget para luego ser llamada aca.  
      builder: (context, state)=>const SnackBarScreen(),
      ),
  ],
);
