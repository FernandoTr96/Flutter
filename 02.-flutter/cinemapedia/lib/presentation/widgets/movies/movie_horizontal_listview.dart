import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {

  final String? title;
  final String? subtitle;
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  
  const MovieHorizontalListview({
    super.key, 
    this.title, 
    this.subtitle, 
    this.loadNextPage,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(title != null || subtitle != null)
          _Title(title: title, subtitle: subtitle),
          Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
             return _Slide(movie: movies[index]); 
            }
          ))
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              /* IMAGE */
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    width: 150,
                    loadingBuilder: (context, child, loadingProgress) {
                      if(loadingProgress != null){
                       return const Padding(padding: EdgeInsets.all(0.8), child: Center(child: CircularProgressIndicator(strokeAlign: 2)));
                      }
                      return FadeIn(child: child);
                    }
                  )
                )
              ),
              const SizedBox(height: 5),
              /* TITLE */
              SizedBox(
                width: 150,
                child: Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.titleSmall,
                )
              ),
              /* RATING */
              Row(
                children: [
                  Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                  const SizedBox(width: 3),
                  Text('${movie.voteAverage}', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                  const SizedBox(width: 10),
                  Text(HumanFormats.compactNumber(movie.popularity), style: textStyles.bodySmall)
                ]
              )
           ]
      )
    );
  }
}

class _Title extends StatelessWidget {
  
  final String? title;
  final String? subtitle;
  
  const _Title({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title != null)
          Text(title!, style: titleStyle),
          const Spacer(),
          if(subtitle != null)
          FilledButton.tonal(onPressed: (){}, style: const ButtonStyle(visualDensity: VisualDensity.compact), child: Text(subtitle!))
        ]
      )
    );
  }
}