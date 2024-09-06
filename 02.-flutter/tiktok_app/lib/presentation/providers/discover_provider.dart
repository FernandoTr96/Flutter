import 'package:flutter/material.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/infraestructure/repositories/video_posts_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostsRepositoryImpl videosRepository;
  
  int page = 1;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider(
    {
      required this.videosRepository
    }
  );

  Future<void> loadNextPage() async{ 
    List<VideoPost> newVideos = await videosRepository.getTrendingVideosByPage(page);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}