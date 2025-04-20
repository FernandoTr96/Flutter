import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  
  final Widget childView;
  static const name = 'home_screen';

  const HomeScreen({
    super.key,
    required this.childView
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation()
    );
  }
}

