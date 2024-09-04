import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(AppTheme.darkThemeSchema),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: Center(
          child: FilledButton(
            onPressed: (){}, 
            child: const Text('Click me !')
          )
        )
      )
    );
  }
}
