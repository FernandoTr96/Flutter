import 'package:flutter/material.dart';
import 'package:tiktok_app/config/helpers/human_formats.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          value: video.likes,
          color: Colors.red,
          onPressed: () {
            
          }
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          value: video.views,
          onPressed: () {
            
          }
        )
      ]
    );
  }
}

class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const _CustomIconButton({
    required this.icon, 
    required this.value, 
    color, 
    required this.onPressed
  }): color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: 35)),
        Text(HumanFormats.compactNumber(value))
      ]
    );
  }
}