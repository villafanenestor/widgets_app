import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Widgets de flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).getThemeData(),
      // home: const HomeScreen(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },//Ahora se utilza Go_Router, se debe cambiar el contructor por nombre a MaterialAPp.router( y enviar el parametro routerCOnfig)
    routerConfig: appRouter,
    );
  }
}
