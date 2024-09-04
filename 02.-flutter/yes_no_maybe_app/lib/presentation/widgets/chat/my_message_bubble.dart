import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    // traer mi tema del contexto
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.primary,
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text('hii mon coeur !'),
          )
        ),
        const SizedBox(height: 10)
      ]
    );
  }
}

