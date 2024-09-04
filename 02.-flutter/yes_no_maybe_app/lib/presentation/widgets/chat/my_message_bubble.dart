import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entitites/message.dart';

class MyMessageBubble extends StatelessWidget {
  
  final Message message;

  const MyMessageBubble({
    required this.message,
    super.key
  });

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(message.text),
          )
        ),
        const SizedBox(height: 10)
      ]
    );
  }
}

