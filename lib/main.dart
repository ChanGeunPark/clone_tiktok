import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTok Clone',
      theme: ThemeData(
          // 테마 설정
          primaryColor: const Color(0xFFE9435A),
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black, // 색상 (아이콘, 글자)
              backgroundColor: Colors.white,
              elevation: 0, // 그림자
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w700,
              ))),
      home: const MainNavigationScreen(),
    );
  }
}
