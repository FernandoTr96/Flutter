import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsRepository {
    Future<List<Actor>> getActors(int movieId);
}