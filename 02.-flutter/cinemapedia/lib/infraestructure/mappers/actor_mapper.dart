import 'package:cinemapedia/config/const/env.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_cast_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast actor) => Actor(
    name: actor.name, 
    characterName: actor.character, 
    photography: actor.profilePath != null ? 
    '${Env.moviedbImgs}${actor.profilePath}' :
    'https://static.wikia.nocookie.net/timeless8259/images/e/e4/Timeless-cast-placeholder-male.jpg/revision/latest/smart/width/250/height/250?cb=20160831202845' 
  );
}