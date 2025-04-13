import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';

part 'initial_loading_provider.g.dart';

@riverpod
bool initialLoading(Ref ref) {

  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final topRatedMovies = ref.watch(topRatedMoviesProvider).isEmpty;
  final upcomingMovies = ref.watch(upcomingMoviesProvider).isEmpty;

  if(nowPlayingMovies || popularMovies || topRatedMovies || upcomingMovies) return true;

  return false;
}
