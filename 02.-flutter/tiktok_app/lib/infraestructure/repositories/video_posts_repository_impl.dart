import 'package:tiktok_app/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {
  
  final VideoPostsDatasource videosDatasource;

  VideoPostsRepositoryImpl({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.indexByPage(page);
  }

}