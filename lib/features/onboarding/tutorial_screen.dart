import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left } // 제스처 방향

enum Page { first, second } // 페이지

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;

  Page _ShowingPage = Page.first;

  // 드래그 제스처가 감지되면 호출
  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // 오른쪽으로 드래그
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // 왼쪽으로 드래그
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  // 드래그 제스처가 끝나면 호출
  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      // page second로 이동
      setState(() {
        _ShowingPage = Page.second;
      });
    } else {
      // page first로 이동
      setState(() {
        _ShowingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 드래그 제스처를 감지하고, 제스처가 감지되면 onPanUpdate 콜백을 호출
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd, // 드래그 제스처가 끝나면 호출

      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gaps.v80,
                  Text(
                    "Watch cool videos! ",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gaps.v80,
                  Text(
                    "Follow the rules!",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Take care of one another!",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              crossFadeState: _ShowingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24, horizontal: Sizes.size24),
            child: AnimatedOpacity(
              opacity: _ShowingPage == Page.second ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: CupertinoButton(
                onPressed: _onEnterAppTap,
                color: Theme.of(context).primaryColor,
                child: const Text("Enter the app!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
