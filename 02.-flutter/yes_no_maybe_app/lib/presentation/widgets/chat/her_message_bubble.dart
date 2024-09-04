import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entitites/message.dart';

class HerMessageBubble extends StatelessWidget {
  
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    // traer mi tema del contexto
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.secondary,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(message.text),
          )
        ),
        const SizedBox(height: 10),
        _ImageBubble(url: message.imageUrl!)
      ]
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String url;

  const _ImageBubble({
    required this.url
  });

  @override
  Widget build(BuildContext context) {

    // dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    final double imageWidth = size.width * 0.6;
    const double imageHeight = 180;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;
          return Container(
            width: imageWidth,
            height: imageHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('loading image...'),
          );
        }
      )
    );
  }
}