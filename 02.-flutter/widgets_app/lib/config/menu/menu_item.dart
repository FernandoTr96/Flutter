import 'package:flutter/material.dart';

class MenuItem {
  
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });

}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones', 
    subtitle: 'Tipos de botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button
  ),
  MenuItem(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estilizado o card', 
    link: '/cards', 
    icon: Icons.credit_card
  ),
];