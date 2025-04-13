import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/index.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.symmetric(vertical: 5),
          )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideShow(movies: slideShowMovies),
                  MovieHorizontalListview(
                    title: 'In the movies',
                    subtitle: 'Today',
                    movies: nowPlayingMovies,
                    loadNextPage: ref.read(nowPlayingMoviesProvider.notifier).loadNextPage
                  ),
                  MovieHorizontalListview(
                    title: 'Popular movies',
                    subtitle: 'trending',
                    movies: popularMovies,
                    loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage
                  ),
                  MovieHorizontalListview(
                    title: 'Top rated movies',
                    subtitle: 'The best',
                    movies: topRatedMovies,
                    loadNextPage: ref.read(topRatedMoviesProvider.notifier).loadNextPage
                  ),
                  MovieHorizontalListview(
                    title: 'Upcoming movies',
                    subtitle: 'soon',
                    movies: upcomingMovies,
                    loadNextPage: ref.read(upcomingMoviesProvider.notifier).loadNextPage
                  ),
                  const SizedBox(height: 15)
                ]
              );
            },
            childCount: 1
          )
        )
      ]
    );
  }
}
