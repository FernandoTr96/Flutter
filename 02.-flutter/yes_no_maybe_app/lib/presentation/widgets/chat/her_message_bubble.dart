import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text('check this ! hehehe'),
          )
        ),
        const SizedBox(height: 10),
        _ImageBubble()
      ]
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    final double imageWidth = size.width * 0.6;
    const double imageHeight = 180;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://yesno.wtf/assets/no/17-829284e9dd894ce9fb65fbe86d2e382c.gif',
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