import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


// riverpod ocupa un provider global para que se pueda acceder al estado global
void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final isDarkMode = ref.watch(darkModeProvider);
    final AppTheme themeNotifier = ref.watch(themeNotifierProvider);

    // para registrar el router hay que usar de matapp el router
    // eso te pedira la config del router y ya no pedira home
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'widgetsApp',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.darkMode()
    );
  }
}
