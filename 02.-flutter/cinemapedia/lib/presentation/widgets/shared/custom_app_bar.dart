import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';

class CustomAppBar extends ConsumerWidget {
  
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // router
    final router = ref.watch(routerProvider);
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
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
                showSearch<Movie?>(
                  query: ref.read(lastMovieQueryProvider),
                  context: context, 
                  delegate: SearchMovieDelegate(
                    lastSearchData: ref.read(searchedMoviesProvider),
                    searchCallback: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery
                  )
                ).then((movie){
                  if(movie == null) return;
                  router.pushNamed(MovieScreen.name, pathParameters: {'id': movie.id.toString()});
                });
              }
            )
          ]
        )
      ) 
    ));
  }
}