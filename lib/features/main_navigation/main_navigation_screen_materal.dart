import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screen = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Search")),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_selectedIndex],

        // material Model 3에서 가져온다.
        // 참고 * https://m3.material.io/components/navigation-bar/overview
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior
              .onlyShowSelected, // label 보이는 타입
          selectedIndex: _selectedIndex, // 현재 인덱스
          onDestinationSelected: _onTap, // 탭했을때 인덱스 변경
          destinations: const [
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.teal,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.amber,
              ),
              label: "Search",
            )
          ],
        ));
  }
}
