import 'package:flutter/material.dart';
import 'package:cinemapedia/config/const/env.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Env.moviedbKey)
    );
  }
}