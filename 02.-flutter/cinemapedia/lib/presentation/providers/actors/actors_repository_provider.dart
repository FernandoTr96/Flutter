import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb/actor_datasource.dart';

part 'actors_repository_provider.g.dart';

@riverpod
ActorRepositoryImpl actorRepository (ref) {
  return ActorRepositoryImpl(ActorDatasource());
}