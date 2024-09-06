import 'package:tiktok_app/domain/entities/video_post.dart';

abstract class VideoPostsRepository {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}