import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';

part 'movies_repository_provider.g.dart';

@riverpod
MovieRepositoryImpl movieRepository (ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
}