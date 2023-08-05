import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/video/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Post Video'),
          ),
        ),
        fullscreenDialog: true, // 전체화면으로 보여줌
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            // Offstage는 화면에 보이지 않게 해준다.
            offstage: _selectedIndex != 0, // 0이 아니면 보이지 않게
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            // Offstage는 화면에 보이지 않게 해준다.
            offstage: _selectedIndex != 1, // 0이 아니면 보이지 않게
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            // Offstage는 화면에 보이지 않게 해준다.
            offstage: _selectedIndex != 2, // 0이 아니면 보이지 않게
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            // Offstage는 화면에 보이지 않게 해준다.
            offstage: _selectedIndex != 3, // 0이 아니면 보이지 않게
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            // Offstage는 화면에 보이지 않게 해준다.
            offstage: _selectedIndex != 4, // 0이 아니면 보이지 않게
            child: const VideoTimelineScreen(),
          )
        ],
      ), // Stack은 여러 하나씩 쌓아서 위젯을 겹쳐서 보여준다.
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // justify spaceBetween
            children: [
              NavTab(
                text: "Home",
                icon: FontAwesomeIcons.house,
                selectIcon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                icon: FontAwesomeIcons.compass,
                selectIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                icon: FontAwesomeIcons.message,
                selectIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                icon: FontAwesomeIcons.user,
                selectIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
