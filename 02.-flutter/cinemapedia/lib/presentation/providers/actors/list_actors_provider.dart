import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';

final listActorsProvider = StateNotifierProvider<ListActorsNotifier,Map<int,List<Actor>>>((ref) {
  final getActorsCallback = ref.watch(actorRepositoryProvider).getActors;
  return ListActorsNotifier(getActorsCallback: getActorsCallback);
});

typedef GetActorsCallback = Future<List<Actor>> Function(int movieId);
class ListActorsNotifier extends StateNotifier<Map<int, List<Actor>>> {

  final GetActorsCallback getActorsCallback;
  ListActorsNotifier({required this.getActorsCallback}): super({});
  
  void loadActors(int movieId) async {
    if(state[movieId] != null) return;
    final actors = await getActorsCallback(movieId);
    state = {...state, movieId:actors};
  }
}