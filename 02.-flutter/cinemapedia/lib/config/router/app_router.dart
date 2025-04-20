import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [

    /* sHELL ROUTES DE MANERA MANUAL SIN LA DOC DE GO ROUTER PARA PRESERVAR ESTADO DE NAVEGACION */
    GoRoute(
      path: '/home/:page',
      builder: (context, state){
        final page = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(page));
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId); 
          }
        )
      ]
    ),

    // redireccion
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home/0',
    )

    /* SHELL ROUTES SEGUN GO ROUTER (AUN NO PRESERVA EL ESTADO AL NAVEGAR) */
    /*  ShellRoute(
      builder: (context, state, child) {
       return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state){
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state){
                final id = state.pathParameters['id'] ?? 'no-id';
                return  MovieScreen(movieId:id);
              }
            )
          ]
        ),
        GoRoute(
          path: '/categories',
          builder: (context, state) => const CategoriesView(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        )
      ]
    ) */
  ]
);