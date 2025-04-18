import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideShow({
    super.key,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index])
      )
    );
  }
}


class _Slide extends StatelessWidget {

  final Movie movie;

  _Slide({
    required this.movie
  });

  // Los estilos de un contenedor se pueden hacer con BoxDecoration
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black45,
        blurRadius: 10,
        offset: Offset(0, 10)
      )
    ]
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      // El decorated box aplica las capas de personalizacion a un elemento
      child: DecoratedBox(
        decoration: decoration,
        // cliprrect aplica bordes redondeados a un elemento
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress != null){
                return const DecoratedBox(decoration: BoxDecoration(
                  color: Color.fromARGB(255, 83, 83, 83),
                ));
              } 
              return FadeIn(child: child);
            }
          )
        )
      )
    );
  }
}