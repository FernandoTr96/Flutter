import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_app/config/theme/app_theme.dart';
import 'package:tiktok_app/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok_app/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok_app/presentation/providers/discover_provider.dart';
import 'package:tiktok_app/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepositoryImpl = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: true,
          create: (context)=> DiscoverProvider(videosRepository: videoPostRepositoryImpl)..loadNextPage()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}
