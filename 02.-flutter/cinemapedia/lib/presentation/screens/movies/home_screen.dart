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
  }

  @override
  Widget build(BuildContext context) {
    
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

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
                    title: 'Comming son',
                    subtitle: 'In a moth',
                    movies: nowPlayingMovies,
                    loadNextPage: ref.read(nowPlayingMoviesProvider.notifier).loadNextPage
                  ),
                  MovieHorizontalListview(
                    title: 'Popular',
                    subtitle: 'This year',
                    movies: nowPlayingMovies,
                    loadNextPage: ref.read(nowPlayingMoviesProvider.notifier).loadNextPage
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
