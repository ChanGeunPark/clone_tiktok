import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VideoPost extends HookWidget {
  const VideoPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}
