import 'package:tiktok_app/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/infraestructure/models/local_video_model.dart';
import 'package:tiktok_app/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostsDatasource {
  
  @override
  Future<List<VideoPost>> indexByUserId(String userId) {
    throw UnimplementedError();
  }  

  @override
  Future<List<VideoPost>> indexByPage(int page) async {
   await Future.delayed(const Duration(seconds: 2));
   final List<VideoPost> newVideos = videoPosts.map((v)=> LocalVideoModel.fromJsonMap(v).toVideoPostEntity()).toList(); 
   return newVideos;
  }

}