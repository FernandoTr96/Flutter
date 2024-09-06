import 'package:flutter/material.dart';
import 'package:tiktok_app/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String url;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.url, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: _controller.initialize(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){           
          return const Center(
            child: CircularProgressIndicator(strokeWidth:2)
          ); 
        }
        return Stack(children: [
          GestureDetector(
            onLongPress: () {
              if(_controller.value.isPlaying && _controller.value.volume == 0){
                _controller.setVolume(1);
                return;
              }
              if(_controller.value.isPlaying && _controller.value.volume == 1){
                _controller.setVolume(0);
                return;
              }
            },
            onTap: () {
              if(_controller.value.isPlaying){
                _controller.pause();
                return;
              }
              _controller.play();
            },
            child: AspectRatio(
              //aspectRatio: _controller.value.aspectRatio, 
              aspectRatio: size.width / size.height, 
              child: VideoPlayer(_controller)
            ),
          ),
          const VideoBackground(),
          Positioned(
            bottom: 30,
            left: 20,
            child: _VideoCaption(caption: widget.caption)
          )
        ]);
      }
    );
  }
}

class _VideoCaption extends StatelessWidget {
  
  final String caption;

  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );

  }
}