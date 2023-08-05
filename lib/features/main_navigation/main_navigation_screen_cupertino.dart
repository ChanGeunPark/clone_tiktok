import 'package:flutter/cupertino.dart';

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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: "Sharch",
        )
      ]),
      tabBuilder: (context, index) => screen[index],
    );
  }
}
