import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({super.key});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/video/pexels-junior-moran.mp4');

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 화면 전체를 채우는 위젯
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.blue,
                ),
        )
      ],
    );
  }
}
