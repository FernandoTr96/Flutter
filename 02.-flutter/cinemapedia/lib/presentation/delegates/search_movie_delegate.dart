import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

// definir tipo de parametro para la peticion http
typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

// si aplicas el tipo generico al extends se indica que devolvera el delegate
class SearchMovieDelegate extends SearchDelegate<Movie?>{

  // podemos pasar al delegate la referencia a la funcion de busqueda
  final SearchMovieCallback searchCallback;
  SearchMovieDelegate({required this.searchCallback});

  // se pueden modificar algunas propiedades como el placeholder
  @override
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // la palabra reservada query es lo que estamos buscando en el delegate y lo que se muestra en el input
      if(query.isNotEmpty)
      IconButton(
        onPressed: ()=> query = '', 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // el metodo close ya es parte del delegate 
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return const Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchCallback(query), 
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieSuggestion(movie: movie);
          }
        );
      }
    );
  }
}

class _MovieSuggestion extends StatelessWidget {
  
  const _MovieSuggestion({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return ListTile(
      leading: Image.network(movie.posterPath),
      title: Text(movie.title, style: textStyles.titleSmall),
      subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: colors.secondary))
    );
  }
}