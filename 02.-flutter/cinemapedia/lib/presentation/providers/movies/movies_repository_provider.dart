import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb_resource_impl.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';

final moviesRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final datasource = MoviedbResourceImpl();
  return MovieRepositoryImpl(datasource);
});