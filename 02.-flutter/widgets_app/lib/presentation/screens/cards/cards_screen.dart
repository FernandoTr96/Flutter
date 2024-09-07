import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  static const name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter cards')),
      body: const Scaffold(
        body: Text('cards screen')
      )
    );
  }
}