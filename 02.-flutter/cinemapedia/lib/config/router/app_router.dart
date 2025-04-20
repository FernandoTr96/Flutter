import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/views/index.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
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
    )

  ]
);