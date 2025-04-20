import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/views/index.dart';
import 'package:cinemapedia/presentation/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  

  static const name = 'home_screen';

  // Recibir el childView solo cuando aplicas shell routes segun go router pero actualmente no guarda el estado de la navegacion
  // final Widget childView;
  
  // recibir vista por parametros debido a que no se usara shell routes
  final int pageIndex;
  final viewRoutes = const<Widget>[
    HomeView(),
    CategoriesView(),
    FavoritesView()
  ];

  const HomeScreen({
    super.key,
    required this.pageIndex
    // required this.childView
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: childView,
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex)
    );
  }
}

