import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/video/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController =
      PageController(); // 페이지 컨트롤러 in pageView

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  void _onPageChange(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;

      // addAll : 리스트에 있는 항목들을 다른 리스트에 추가해준다.
      colors.addAll([
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // PageView.builder는 ListView.builder와 비슷하다.
    // 페이지가 보일때 랜더링을 해준다. (화면에 보이는 페이지만 랜더링)
    // 여러개의 페이지를 한번에 가지고있는것보다 효율적이다.
    return PageView.builder(
      controller: _pageController, // 페이지 컨트롤러
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChange,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: const VideoPost(),
      ),
      itemCount: _itemCount,
    );
  }
}
