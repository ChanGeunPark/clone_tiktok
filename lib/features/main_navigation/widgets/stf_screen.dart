import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks = _clicks + 1;
    });
  }

  // dispose는 위젯이 메모리에서 해제될 때 호출된다.
  // 완전히 새로운 화면이다
  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$_clicks",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}
