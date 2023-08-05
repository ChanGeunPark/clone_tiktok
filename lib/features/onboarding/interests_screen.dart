import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  // 스크롤 컨트롤러 설정
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      if (!_showTitle) return;
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    // event를 수신하는 객체를 제거 [eventListener를 사용할때]
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text("Choose your interests")),
      ),
      body: Scrollbar(
        controller: _scrollController, // 컨트롤러를 전달 받는다.

        child: SingleChildScrollView(
          // SingleChildScrollView 위젯은 자식 위젯을 스크롤 가능한 단일 위젯으로 만듦

          controller: _scrollController, // 컨트롤러를 전달 받는다.
          child: Padding(
            padding: const EdgeInsets.only(
                // px-24
                left: Sizes.size24,
                right: Sizes.size24,
                bottom: Sizes.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text("Choose your interests",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    )),
                Gaps.v20,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  // Wrap 위젯은 자식 위젯을 가로로 나열하고, 공간이 부족하면 자식 위젯을 다음 줄로 넘김 [flex flex-wrap]
                  runSpacing: 15, // 세로간격 [space-y-10]
                  spacing: 15, // 가로간격 [space-x-10]

                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2, // 그림자
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: Sizes.size40,
              top: Sizes.size16,
              left: Sizes.size24,
              right: Sizes.size24),
          child: GestureDetector(
            onTap: _onNextTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                // px-12
                vertical: Sizes.size20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
