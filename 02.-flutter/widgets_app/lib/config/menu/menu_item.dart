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
  MenuItem(
    title: 'Animaciones', 
    subtitle: 'Pantalla animada', 
    link: '/animated', 
    icon: Icons.animation
  ),
  MenuItem(
    title: 'Tutoriales', 
    subtitle: 'Tutorial para la aplicacion', 
    link: '/app-tutorial', 
    icon: Icons.check
  ),
  MenuItem(
    title: 'Scroll infinito', 
    subtitle: 'Listado infinito', 
    link: '/infinite-scroll', 
    icon: Icons.arrow_downward
  ),
  MenuItem(
    title: 'Loaders', 
    subtitle: 'Indicadores de progreso y carga', 
    link: '/progress', 
    icon: Icons.circle
  ),
  MenuItem(
    title: 'Alertas', 
    subtitle: 'Snackbar y alertas', 
    link: '/snackbar', 
    icon: Icons.warning
  ),
  MenuItem(
    title: 'UI', 
    subtitle: 'Controles de ui', 
    link: '/ui-controls', 
    icon: Icons.control_point_sharp
  ),
];