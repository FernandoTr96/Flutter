import 'package:cinemapedia/config/const/env.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_cast_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast actor) => Actor(
    name: actor.name, 
    characterName: actor.character, 
    photography: '${Env.moviedbUrl}${actor.profilePath}'
  );
}