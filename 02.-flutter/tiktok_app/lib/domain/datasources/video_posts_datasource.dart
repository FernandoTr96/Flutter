import 'package:tiktok_app/domain/entities/video_post.dart';

abstract class VideoPostsDatasource {
  Future<List<VideoPost>> indexByUserId(String userId);
  Future<List<VideoPost>> indexByPage(int page);
}