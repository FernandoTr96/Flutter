import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_slide_show_provider.g.dart';

@riverpod
List<Movie> moviesSlideShow(Ref ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if(nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0,6);
}