import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    /* NAVEGAR A LAS VISTAS USANDO SHELL ROUTES DE GOROUTER */

    /*int getCurrentIndex(BuildContext context) {
      final String location = GoRouterState.of(context).matchedLocation;
      switch (location) {
        case '/':
          return 0;
        case '/categories':
          return 1;
        case '/favorites':
          return 2;
        default:
          return 0;
      }
    } 
  */

    /*  void onItemTapped(BuildContext context, int idx) {
      switch (idx) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/categories');
          break;
        case 2:
          context.go('/favorites');
          break;
      }
    } 
  */

    /* VALIDACIONES SIN SHELL ROUTES */
    // solo usamos el parametro

    return BottomNavigationBar(
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondary,
        currentIndex: currentIndex,
        onTap: (value) => context.go('/home/$value'),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorites')
        ]);
  }
}
