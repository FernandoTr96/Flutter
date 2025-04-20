import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

// definir tipo de parametro para la peticion http
typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

// si aplicas el tipo generico al extends se indica que devolvera el delegate
class SearchMovieDelegate extends SearchDelegate<Movie?>{

  // recibir ultima busqueda
  List<Movie> lastSearchData;
  // podemos pasar al delegate la referencia a la funcion de busqueda
  final SearchMovieCallback searchCallback;
  // multioples listeners si agregas el broadcast
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  //loader
  StreamController<bool> isLoading = StreamController();
  // para guardar intervalo de tiempo o timeout
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchCallback, 
    this.lastSearchData = const []
  })
  // con el constructor se definen los parametros del delegate
  :super(
    searchFieldLabel: 'Buscar pelicula'
  );

  // metodo para el debounce
  // puede ser async
  void _onQueryChanged(String query){
    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    isLoading.add(true);
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      final movies = await searchCallback(query);
      debounceMovies.add(movies);
      // se actualiza manualmente porque aun que el provider cambia el listado en cada busqueda
      // los cambios no llegan al search delegate debido a que no esta relacionado al arbol de widgets es mas una clase
      lastSearchData = movies;
      isLoading.add(false);
    });
  }

  // eliminar instancias del stream
  void _clearStreams(){
    debounceMovies.close();
  }

  // metodo para gestionar la busqueda en las sugerencias y con el enter
  Widget buildSearch(){
    return StreamBuilder(    
      initialData: lastSearchData,
      stream: debounceMovies.stream, 
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieSuggestion(
              movie: movie, 
              onMovieSelected: (context, movie){
                _clearStreams();
                close(context, movie);
              }
            );
          }
        );
      }
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: isLoading.stream,
        builder: (context, snapshot) {
          if(snapshot.data ?? false){
            return Spin(infinite: true, child: const Icon(Icons.movie_creation_outlined));
          } 
          return query.isNotEmpty ? IconButton(
            onPressed: ()=> query = '', 
            icon: const Icon(Icons.clear)
          ) : const SizedBox();
        }
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // el metodo close ya es parte del delegate 
    return IconButton(
      onPressed: (){
        _clearStreams();
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return buildSearch();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   _onQueryChanged(query);
   return buildSearch();
  }
}

class _MovieSuggestion extends StatelessWidget {
  
  final Movie movie;
  final void Function(BuildContext, Movie?) onMovieSelected;

  const _MovieSuggestion({
    required this.movie,
    required this.onMovieSelected
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return ListTile(
      leading: Image.network(movie.posterPath),
      title: Text(movie.title, style: textStyles.titleSmall),
      subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: colors.secondary)),
      onTap: () => onMovieSelected(context, movie)
    );
  }
}