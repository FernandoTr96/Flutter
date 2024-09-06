import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok_app/shared/interfaces/use_case.dart';

class GetTrendingVideosByPageUseCase implements ExecuteByParamUseCase<
  Future<List<VideoPost>>,
  int 
> {

  final VideoPostsRepositoryImpl _videoPostRepository;

  GetTrendingVideosByPageUseCase({required VideoPostsRepositoryImpl videoPostRepository}) : _videoPostRepository = videoPostRepository;
  
  @override
  Future<List<VideoPost>> executeByParam(page) {
   return _videoPostRepository.getTrendingVideosByPage(page);
  }
  
}