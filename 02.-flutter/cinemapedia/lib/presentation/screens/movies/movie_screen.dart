import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {
  
  static const name = 'movie_screen';
  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {

    final movie = ref.watch(movieInfoProvider)[widget.movieId];
    if(movie == null) return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) => _MovieDescription(movie: movie), childCount: 1))
        ]
      )
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {

  final Movie movie;
  
  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        title: Text(
          movie.title, 
          style: const TextStyle(fontSize: 20), 
          textAlign: TextAlign.start
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover)
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87
                    ]
                  )
                )
              )
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.1, 0.5],
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ]
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}

class _MovieDescription extends StatelessWidget {
  
  final Movie movie;

  const _MovieDescription({required this.movie});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        /* iNFORMACION DE LA PELICULA */
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3
                )
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  children: [
                    Text(movie.overview, textAlign: TextAlign.justify)
                  ]
                )
              )
            ]
          )
        ),
        const SizedBox(height: 10),
        
        /* GENEROS */
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ...movie.genreIds.map((g)=> Badge(
                label: Padding(padding: const EdgeInsets.all(5), child: Text(g, style: textStyles.labelLarge)), 
                textColor: Colors.white, 
                backgroundColor: colors.primary
              ))
            ]
          )
        )

      ]
    );
  }
}

