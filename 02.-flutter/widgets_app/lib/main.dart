import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // para registrar el router hay que usar de matapp el router
    // eso te pedira la config del router y ya no pedira home
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'widgetsApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(Colors.indigo)
    );
  }
}