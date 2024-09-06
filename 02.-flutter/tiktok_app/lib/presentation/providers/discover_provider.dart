import 'package:flutter/material.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/infraestructure/models/local_video_model.dart';
import 'package:tiktok_app/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async{ 
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts.map((v)=> LocalVideoModel.fromJsonMap(v).toVideoPostEntity()).toList(); 
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}