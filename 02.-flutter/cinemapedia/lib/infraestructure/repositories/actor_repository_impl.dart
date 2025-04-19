import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl implements ActorsRepository {

  final ActorsDatasource _datasource;

  ActorRepositoryImpl(this._datasource);
  
  @override
  Future<List<Actor>> getActors(int movieId) {
    return _datasource.getActors(movieId);
  }
}