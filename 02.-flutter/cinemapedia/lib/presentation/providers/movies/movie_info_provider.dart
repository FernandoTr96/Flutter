import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref) {
  final getMovieCallback = ref.watch(movieRepositoryProvider).getMovie;
  return MovieMapNotifier(movieDetailCallback: getMovieCallback);
});

typedef StringCallback = Future<Movie> Function(String);

class MovieMapNotifier extends StateNotifier<Map<String,Movie>>{
  
  final StringCallback movieDetailCallback;

  MovieMapNotifier({required this.movieDetailCallback}) : super({});

  Future<void> loadMovie(String id) async {
    if(state.containsKey(id)) return;
    final movie = await movieDetailCallback(id);
    state = {...state, id:movie};
  }
}