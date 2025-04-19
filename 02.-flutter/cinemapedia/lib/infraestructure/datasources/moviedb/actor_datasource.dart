import 'package:dio/dio.dart';
import 'package:cinemapedia/config/const/env.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_cast_response.dart';

class ActorDatasource implements ActorsDatasource {
  
  final dio = Dio(BaseOptions(baseUrl: Env.moviedbUrl, queryParameters: {
    'api_key': Env.moviedbKey,
    'language': Env.moviedbLanguage
  }));

  @override
  Future<List<Actor>> getActors(int movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final movieInfo = MoviedbCastResponse.fromJson(response.data);
    final List<Actor> actors = movieInfo.cast.map((castElement) => ActorMapper.castToEntity(castElement)).toList();
    return actors;
  }
}
