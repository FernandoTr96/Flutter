import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Los colores siempre deben venir del tema
    final colors = Theme.of(context).colorScheme;
    // Valor de titulos
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    // safe area deja un espacio para el notch de los telefonos asi no se pone por detras el contenido
    return SafeArea(
      bottom: false,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie_outlined, color: colors.primary),
            const SizedBox(width: 5),
            Text('Cinemapedia', style: titleStyle),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ]
        )
      ) 
    ));
  }
}