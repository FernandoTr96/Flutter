import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10),
          Text('Cooking pop corns'),
        ]
      )
    );
  }
}