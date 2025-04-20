import 'package:cinemapedia/config/const/env.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_details.dart';

class MovieMapper {
  static Movie movieToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? '${Env.moviedbImgs}${moviedb.backdropPath}'
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? '${Env.moviedbImgs}${moviedb.posterPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png',
      releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
  );

  static Movie movieDetailsToEntity(MoviedbDetails details) => Movie(
      adult: details.adult,
      backdropPath: (details.backdropPath != '')
          ? '${Env.moviedbImgs}${details.backdropPath}'
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: details.genres.map((e) => e.name).toList(),
      id: details.id,
      originalLanguage: details.originalLanguage,
      originalTitle: details.originalTitle,
      overview: details.overview,
      popularity: details.popularity,
      posterPath: (details.posterPath != '')
          ? '${Env.moviedbImgs}${details.posterPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png',
      releaseDate: details.releaseDate,
      title: details.title,
      video: details.video,
      voteAverage: details.voteAverage,
      voteCount: details.voteCount
  );
}
