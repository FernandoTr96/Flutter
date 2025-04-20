import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lastMovieQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final searchMoviesCallback = ref.watch(movieRepositoryProvider).searchMovies;
  return SearchedMoviesNotifier(
    ref: ref,
    searchMoviesCallback: searchMoviesCallback
  );
}); 

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {

  final Ref ref;
  final Future<List<Movie>> Function(String query) searchMoviesCallback; 

  SearchedMoviesNotifier({required this.searchMoviesCallback, required this.ref}): super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async{
    final movies = await searchMoviesCallback(query);
    ref.read(lastMovieQueryProvider.notifier).update((state)=> query);
    state = movies;
    return movies;
  }
}